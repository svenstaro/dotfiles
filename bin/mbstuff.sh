#!/bin/bash
set -eux

beet lastgenre
beet fetchart
beet mbsync
beet fingerprint
beet submit
beet acousticbrainz
# beet update
beet bad
beet stats
