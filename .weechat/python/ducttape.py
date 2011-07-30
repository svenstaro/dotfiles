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
import re
import json
import urllib2

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
    """ Prints url to official site. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Site: "+SITE)
    return weechat.WEECHAT_RC_OK

def wiki_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints url to wiki. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Wiki: "+WIKI)
    return weechat.WEECHAT_RC_OK

def docs_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints url to API docs. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Docs: "+DOCS)
    return weechat.WEECHAT_RC_OK

def github_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints url to github repo. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        weechat.command(buffer, "Github: "+GITHUB)
    return weechat.WEECHAT_RC_OK

def issue_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    """ Prints issue info and url. """
    buffer_name = weechat.buffer_get_string(buffer, "name")
    if(buffer_name in CHANNELS):
        res = re.search("#([\d]+)", message)
        if res:
            num = res.group(1)

            #try:
            url = "https://api.github.com/repos/{0}/{1}/issues/{2}".\
                    format("ducttape", "ducttape-engine", num)
            req = urllib2.Request(url=url)
            response = urllib2.urlopen(req)
            data = response.read()
            issue = json.loads(data)
            title = issue["title"]
            print title
            assignee = issue["assignee"]
            assignee_str = "nobody"
            if assignee:
                assignee_str = assignee["login"]

            weechat.command(buffer, "Issue #{0}: {1} [{2}]\n=> {3}".\
                    format(num, title, assignee_str, GITHUB+"/issues/"+str(num)))

            #except:
            #    print sys.exc_info()[0]
            #    pass
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
    weechat.hook_print("", "", "#", 1, "issue_cb", "")
else:
    print "failed to load weechat"

