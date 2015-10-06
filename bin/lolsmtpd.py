#!/usr/bin/env python

import os
from smtpd import SMTPServer

class LolSmtpServer(SMTPServer):
    def process_message(self, peer, mailfrom, rcpttos, data):
        inheaders = 1
        lines = data.split('\n')
        print('---------- MESSAGE FOLLOWS ----------')
        for line in lines:
            # headers first
            if inheaders and not line:
                print('X-Peer:', peer[0])
                inheaders = 0
            if line.endswith('='):
                print(line[:-1], end='')
            else:
                print(line)
        print('------------ END MESSAGE ------------')

if __name__ == "__main__":
    os.system("python -m smtpd -n -c lolsmtpd.LolSmtpServer pseudoform.org:25")
