--[[
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Sjshovan (Apogee) BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name     = 'Battle Stations'
_addon.description = 'Change or remove the default battle music.'
_addon.author   = 'Sjshovan (Apogee) sjshovan@gmail.com'
_addon.version  = '0.9.1'
_addon.commands = {'battlestations', 'stations', 'bs'}

local _logger = require('logger')
local _config  = require('config')
local _packets = require('packets')

require('functions')
require('constants')
require('helpers')

local defaults = {
    stations = {
        solo = 107.3,
        party = 107.3
    }
}

local settings = _config.load(defaults)

local help = {
    commands = {
        buildHelpSeperator('=', 28),
        buildHelpTitle('Commands'),
        buildHelpSeperator('=', 28),
        buildHelpCommandEntry('list [radios|stations] [category#]', 'Display the available radios and or stations.'),
        buildHelpCommandEntry('set <station> [radio]', 'Set radio(s) to the given station.'),
        buildHelpCommandEntry('get [radio]', 'Display currently set station on the given radio(s).'),
        buildHelpCommandEntry('default [radio]', 'Set radio(s) to the default station (Current Zone Music).'),
        buildHelpCommandEntry('normal [radio]', 'Set radio(s) to the original game music.'),
        buildHelpCommandEntry('reload', 'Reload Battle Stations.'),
        buildHelpCommandEntry('about', 'Display information about Battle Stations.'),
        buildHelpCommandEntry('help', 'Display Battle Stations commands.'),
        buildHelpSeperator('=', 28),
    },

    radios = {
        buildHelpSeperator('=', 25),
        buildHelpTitle('Radios'),
        buildHelpSeperator('=', 25),
        buildHelpRadioEntry(stations.receivers.solo:ucfirst(), 'Plays Solo Battle Music'),
        buildHelpRadioEntry(stations.receivers.party:ucfirst(), 'Plays Party Battle Music'),
        buildHelpSeperator('=', 25),
    },
    
     about = {
        buildHelpSeperator('=', 23),
        buildHelpTitle('About'),
        buildHelpSeperator('=', 23),
        buildHelpTypeEntry('Name', _addon.name),
        buildHelpTypeEntry('Description', _addon.description),
        buildHelpTypeEntry('Author', _addon.author),
        buildHelpTypeEntry('Version', _addon.version),
        buildHelpSeperator('=', 23),
    },
    
    aliases = {
        list = {
            stations = T{
                's', 
                'station',
                'stations',
            },
            radios = T{
                'r',
                'radio', 
                'radios',
                'receiver',
                'receivers'
            },
            categories = T{
                'c',
                'cat',
                'category',
                'categories'
            },
            all = T{
                '*',
                'a',
                'all',
            }
        } 
    }
}