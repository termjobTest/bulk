# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
#
# Copyright 2015 (c) Lei Xu <eddyxu@gmail.com>

from __future__ import absolute_import
from builtins import str

import argparse
import hashlib
import io
import os
import re
import subprocess
import sys

from . import gitrepo


_CPP_EXTENSIONS = ['.h', '.hh', '.hpp', '.hxx', '.c', '.cc', '.cpp', '.cxx', '.m', '.mm']
_SKIP_DIRS = set(['.git', '.hg', '.svn', 'deps'])


def create_args(params):
    parser = argparse.ArgumentParser('coveralls')
    parser.add_argument('--verbose', action='store_true',
                        help='print verbose messages')
    parser.add_argument('--dryrun', action='store_true',
                        help='run coveralls without uploading report')
    parser.add_argument('--gcov', metavar='FILE', default='gcov',
                        help='set the location of gcov')
    parser.add_argument('--gcov-options', metavar='GCOV_OPTS', default='',
                        help='set the options given to gcov')
    parser.add_argument('-r', '--root', metavar='DIR', default='.',
                        help='set the root directory')
    parser.add_argument('-b', '--build-root', metavar='DIR',
                        help='set the directory from which gcov will '
                             'be called; by default gcov is run in the '
                             'directory of the .o files; however the paths '
                             'of the sources are often relative to the '
                             'directory from which the compiler was run and '
                             'these relative paths are saved in the .o '
                             'file; when this happens, gcov needs to run in '
                             'the same directory as the compiler in order '
                             'to find the source files')
    parser.add_argument('-e', '--exclude', metavar='DIR|FILE', action='append',
                        help='set exclude file or directory', default=[])
    parser.add_argument('-i', '--include', metavar='DIR|FILE', action='append',
                        help='set include file or directory', default=[])
    parser.add_argument('-E', '--exclude-pattern', dest='regexp',
                        action='append', metavar='REGEXP', default=[],
                        help='set exclude file/directory pattern')
    parser.add_argument('--exclude-lines-pattern',
                        action='append', metavar='REGEXP', default=[],
                        help='set exclude file/directory pattern')
    parser.add_argument('-x', '--extension', metavar='EXT', action='append',
                        help='set extension of files to process')
    parser.add_argument('-y', '--coveralls-yaml', default='.coveralls.yml',
                        metavar='FILE',
                        help='coveralls yaml file name '
                             '(default: .coveralls.yml)')
    parser.add_argument('-n', '--no-gcov', action='store_true', default=False,
                        help='do not run gcov')
    parser.add_argument('-t', '--repo-token', '--repo_token', default='',
                        metavar='TOKEN',
                        help='set the repo_token of this project, '
                             'alternatively you can set the environmental '
                             'variable COVERALLS_REPO_TOKEN')
    parser.add_argument('--encodings',
                        default=['utf-8', 'latin-1'], nargs='+',
                        help='source encodings to try in order of preference '
                             '(default: %(default)s)')
    parser.add_argument('--dump', nargs='?', type=argparse.FileType('w'),
                        help='dump JSON payload to a file',
                        default=None, metavar='FILE')
    parser.add_argument('--follow-symlinks', action='store_true',
                        help='Follow symlinks (default off)')
    parser.add_argument('-l', '--lcov-file', metavar='FILE',
                        help='Upload lcov generated info file')
    parser.add_argument('--max-cov-count', metavar='NUMBER', type=int,
                        help='Max number for line coverage count. If line'
                             'coverage count is greater than the given number'
                             '(Max + 1) will be put instead. Helps in managing'
                             'line coverage count which is higher than max int'
                             'value supported by coveralls.')
    parser.add_argument('--skip-ssl-verify',
                        help='skip ssl certificate verification when '
                        'communicating with the coveralls server',
                        action='store_true', default=False)

    return parser.parse_args(params)


def is_source_file(args, filepath):
    """Returns true if it is a C++ source file."""
    if args.extension:
        return os.path.splitext(filepath)[1] in args.extension
    else:
        return os.path.splitext(filepath)[1] in _CPP_EXTENSIONS

