# 
# Ducttape script, version 0.1
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

SCRIPT_NAME    = "ducttape"
SCRIPT_AUTHOR  = "Sven-Hendrik Haase <sh@lutzhaase.com>"
SCRIPT_VERSION = "0.1"
SCRIPT_LICENSE = "GPL"
SCRIPT_DESC    = "Provides helpful commands for Ducttape"
CONFIG_FILE_NAME= "ducttape"
SCRIPT_COMMAND = "ducttape"

# put this into some run-time editable data type
CHANNELS       = ("freenode-ssl.#ducttape-dev")
SITE           = "http://ducttape-dev.org/"
WIKI           = "https://github.com/ducttape/ducttape-engine/wiki"
DOCS           = "http://ducttape-dev.org/docs/"
GITHUB         = "https://github.com/ducttape/ducttape-engine"

def site_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to current contest rules. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Site: "+SITE)
    return weechat.WEECHAT_RC_OK

def wiki_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints URL to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Wiki: "+WIKI)
    return weechat.WEECHAT_RC_OK

def docs_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints 'no' to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Docs: "+DOCS)
    return weechat.WEECHAT_RC_OK

def github_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints 'no' to subreddit. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Github: "+GITHUB)
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
    weechat.hook_print("", "", "!site", 1, "site_cb", "")
    weechat.hook_print("", "", "!web", 1, "site_cb", "")
    weechat.hook_print("", "", "!wiki", 1, "wiki_cb", "")
    weechat.hook_print("", "", "!docs", 1, "docs_cb", "")
    weechat.hook_print("", "", "!api", 1, "docs_cb", "")
    weechat.hook_print("", "", "!github", 1, "github_cb", "")
    weechat.hook_print("", "", "!repo", 1, "github_cb", "")
    weechat.hook_print("", "", "!gh", 1, "github_cb", "")
else:
    print "failed to load weechat"

