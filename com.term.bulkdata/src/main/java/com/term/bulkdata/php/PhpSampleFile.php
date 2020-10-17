<?php
/**
 * php-token-stream
 *
 * Copyright (c) 2009-2010, Sebastian Bergmann <sebastian@phpunit.de>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Sebastian Bergmann nor the names of his
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @package   PHP_TokenStream
 * @author    Sebastian Bergmann <sebastian@phpunit.de>
 * @copyright 2009-2010 Sebastian Bergmann <sebastian@phpunit.de>
 * @license   http://www.opensource.org/licenses/BSD-3-Clause  The BSD 3-Clause License
 * @link      http://github.com/sebastianbergmann/php-token-stream/tree
 * @since     File available since Release 1.1.0
 */

spl_autoload_register(
  function ($class)
  {
      static $classes = NULL;
      static $path = NULL;;

      if ($classes === NULL) {
          $classes = array(
            'php_token' => '/Token.php',
            'php_token_abstract' => '/Token.php',
            'php_token_ampersand' => '/Token.php',
            'php_token_and_equal' => '/Token.php',
            'php_token_array' => '/Token.php',
            'php_token_array_cast' => '/Token.php',
            'php_token_as' => '/Token.php',
            'php_token_at' => '/Token.php',
            'php_token_backtick' => '/Token.php',
            'php_token_bad_character' => '/Token.php',
            'php_token_bool_cast' => '/Token.php',
            'php_token_boolean_and' => '/Token.php',
            'php_token_boolean_or' => '/Token.php',
            'php_token_break' => '/Token.php',
            'php_token_callable' => '/Token.php',
            'php_token_caret' => '/Token.php',
            'php_token_case' => '/Token.php',
            'php_token_catch' => '/Token.php',
            'php_token_character' => '/Token.php',
            'php_token_class' => '/Token.php',
            'php_token_class_c' => '/Token.php',
            'php_token_clone' => '/Token.php',
            'php_token_close_bracket' => '/Token.php',
            'php_token_close_curly' => '/Token.php',
            'php_token_close_square' => '/Token.php',
            'php_token_close_tag' => '/Token.php',
            'php_token_colon' => '/Token.php',
            'php_token_comma' => '/Token.php',
            'php_token_comment' => '/Token.php',
            'php_token_concat_equal' => '/Token.php',
            'php_token_const' => '/Token.php',
            'php_token_constant_encapsed_string' => '/Token.php',
            'php_token_continue' => '/Token.php',
            'php_token_curly_open' => '/Token.php',
            'php_token_dec' => '/Token.php',
            'php_token_declare' => '/Token.php',
            'php_token_default' => '/Token.php',
            'php_token_dir' => '/Token.php',
            'php_token_div' => '/Token.php',
            'php_token_div_equal' => '/Token.php',
            'php_token_dnumber' => '/Token.php',
            'php_token_do' => '/Token.php',
            'php_token_doc_comment' => '/Token.php',
            'php_token_dollar' => '/Token.php',
            'php_token_dollar_open_curly_braces' => '/Token.php',
            'php_token_dot' => '/Token.php',
            'php_token_double_arrow' => '/Token.php',
            'php_token_double_cast' => '/Token.php',