# 
# Game Jam script, version 0.3 for Reddit Game Jam
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
import json
import urllib2

try:
    import weechat
    import_ok = True
except:
    print "This script must be run under WeeChat."
    print "Get WeeChat now at: http://weechat.flashtux.org/"
    import_ok = False

SCRIPT_NAME    = "gamejam"
SCRIPT_AUTHOR  = "Sven-Hendrik Haase <sh@lutzhaase.com>"
SCRIPT_VERSION = "0.3"
SCRIPT_LICENSE = "GPL"
SCRIPT_DESC    = "Provides time to/during a game contest and other commands"
CONFIG_FILE_NAME= "gamejam"
SCRIPT_COMMAND = "gamejam"

# put this into some run-time editable data type
SITE = "http://bacongamejam.org"
SITE_INFO_URL = SITE + "/site_info"
CURRENT_JAM_INFO_URL = SITE + "/current_jam_info"
CHANNELS = ("freenode-ssl.#bacongamejam")

def rules_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to current contest rules. """
    site_info = json.load(urllib2.urlopen(SITE_INFO_URL))
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Rules for current contest: " + site_info["rules"])
    return weechat.WEECHAT_RC_OK

def countdown_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to current jam countdown. """
    current_jam_info = json.load(urllib2.urlopen(CURRENT_JAM_INFO_URL))
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Countdown: " + SITE + '/jams/' + current_jam_info["slug"] + '/countdown')
    return weechat.WEECHAT_RC_OK

def subreddit_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to subreddit. """
    site_info = json.load(urllib2.urlopen(SITE_INFO_URL))
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Subreddit: " + site_info["subreddit"])
    return weechat.WEECHAT_RC_OK

def site_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Site: " + SITE)
    return weechat.WEECHAT_RC_OK

def time_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints remaining time to jam when jam is not running and outputs 
    remaining time in case jam is running. """
    current_jam_info = json.load(urllib2.urlopen(CURRENT_JAM_INFO_URL))
    time_of_jam = datetime.datetime.strptime(current_jam_info["start_time"], "%Y-%m-%d %H:%M:%S")
    length_of_jam = datetime.timedelta(hours=current_jam_info["duration"])
    now = datetime.datetime.utcnow()
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        if(now < time_of_jam): 
            # contest hasn't started yet, provide time to start
            time_to_jam = time_of_jam - now
            weechat.command(buffer, "Time to contest: "+str(time_to_jam))
        if(time_of_jam < now < time_of_jam + length_of_jam):
            # contest has already started, provide time to end
            time_left = (time_of_jam + length_of_jam) - now
            weechat.command(buffer, "Contest ends in: "+str(time_left))
        if(now > time_of_jam + length_of_jam):
            # contest has already ended, provide time to last contest
            time_left = (time_of_jam + length_of_jam) - now
            time_left = -time_left
            weechat.command(buffer, "Last contest is this long ago: "+str(time_left))
    return weechat.WEECHAT_RC_OK

def participants_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints number of participants in the current jam. """
    current_jam_info = json.load(urllib2.urlopen(CURRENT_JAM_INFO_URL))
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Number of participants: "+str(current_jam_info["participants_count"]))
    return weechat.WEECHAT_RC_OK

def teams_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints number of teams in the current jam. """
    current_jam_info = json.load(urllib2.urlopen(CURRENT_JAM_INFO_URL))
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Number of teams: "+str(current_jam_info["teams_count"]))
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
    weechat.hook_print("", "", "!rules", 1, "rules_cb", "")
    weechat.hook_print("", "", "!countdown", 1, "countdown_cb", "")
    weechat.hook_print("", "", "!subreddit", 1, "subreddit_cb", "")
    weechat.hook_print("", "", "!site", 1, "site_cb", "")
    weechat.hook_print("", "", "!time", 1, "time_cb", "")
    weechat.hook_print("", "", "!participants", 1, "participants_cb", "")
    weechat.hook_print("", "", "!teams", 1, "teams_cb", "")
    weechat.hook_print("", "", "!sleep", 1, "sleep_cb", "")
else:
    print "failed to load weechat"
