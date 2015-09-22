#!/usr/bin/env python

from smtpd import SMTPServer

class LolSmtpServer(SMTPServer):
    def __init__():
        super().__init__("pseudoform.org:25")

    def process_message(peer, mailfrom, rcpttos, data, **kwargs):
        print(data)
