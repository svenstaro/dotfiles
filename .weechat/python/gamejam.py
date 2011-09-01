# 
# Game Jam script, version 0.2 for Reddit Game Jam
#
#   Listens for a few text commands in a channel prefixed by '!' and responds
#   accordingly. Reports things like contest time.
#
# Usage:
# 
#   

import sys
import os
import datetime
import time
try:
    import weechat
    import_ok = True
except:
    print "This script must be run under WeeChat."
    print "Get WeeChat now at: http://weechat.flashtux.org/"
    import_ok = False

SCRIPT_NAME    = "gamejam"
SCRIPT_AUTHOR  = "Sven-Hendrik Haase <sh@lutzhaase.com>"
SCRIPT_VERSION = "0.2"
SCRIPT_LICENSE = "GPL"
SCRIPT_DESC    = "Provides time to/during a game contest and other commands"
CONFIG_FILE_NAME= "gamejam" 
SCRIPT_COMMAND = "gamejam"

# put this into some run-time editable data type
CHANNELS       = ("freenode-ssl.#bacongamejam")
RULES          = "http://www.reddit.com/r/BaconGameJam/comments/eattc/reddit_game_jam_04_rules/"
SUBREDDIT      = "http://www.reddit.com/r/BaconGameJam/"
TIME_OF_JAM    = datetime.datetime(2011, 3, 25, 22, 0, 0, 0, None)
LENGTH_OF_JAM  = datetime.timedelta(0, 0, 0, 0, 0, 48, 0)

def rules_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to current contest rules. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Rules for current contest: "+RULES)
    return weechat.WEECHAT_RC_OK

def subreddit_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Subreddit: "+SUBREDDIT)
    return weechat.WEECHAT_RC_OK

def time_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints remaining time to jam when jam is not running and outputs 
    remaining time in case jam is running. """
    now = datetime.datetime.utcnow()
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        if(now < TIME_OF_JAM): 
            # contest hasn't started yet, provide time to start
            time_to_jam = TIME_OF_JAM - now
            weechat.command(buffer, "Time to contest: "+str(time_to_jam))
        if(TIME_OF_JAM < now < TIME_OF_JAM + LENGTH_OF_JAM):
            # contest has already started, provide time to end
            time_left = (TIME_OF_JAM + LENGTH_OF_JAM) - now
            weechat.command(buffer, "Contest ends in: "+str(time_left))
        if(now > TIME_OF_JAM + LENGTH_OF_JAM):
            # contest has already ended, provide time to last contest
            time_left = (TIME_OF_JAM + LENGTH_OF_JAM) - now
            time_left = -time_left
            weechat.command(buffer, "Last contest is this long ago: "+str(time_left))
    return weechat.WEECHAT_RC_OK

def sleep_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints 'no' to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "no")
    return weechat.WEECHAT_RC_OK

def gj_unload_script():
    """ Function called when script is unloaded. """
#    global urlGrabSettings
#    weechat.config_write(urlGrabSettings.config_file)
    return weechat.WEECHAT_RC_OK

# Main stuff
if (import_ok and
    weechat.register(SCRIPT_NAME, SCRIPT_AUTHOR, SCRIPT_VERSION,
        SCRIPT_LICENSE, SCRIPT_DESC, "gj_unload_script", "")):
#    GameJamSettings = GameJamSettings()
    weechat.hook_print("", "", "!rules", 1, "rules_cb", "")
    weechat.hook_print("", "", "!subreddit", 1, "subreddit_cb", "")
    weechat.hook_print("", "", "!time", 1, "time_cb", "")
    weechat.hook_print("", "", "!sleep", 1, "sleep_cb", "")
else:
    print "failed to load weechat"
