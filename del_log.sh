#!/bin/sh

# both stage 2a and stage 2b which will delete all the website.log.x from /jrunlog where x < 5.
# we keep  website.log website.log.1 website.log.2 website.log.3 website.log.4 and delete the rest website.logs . 

find /jrunlog/ -name "website.log.[5-9]" -exec rm -f {} \ && find /jrunlog/ -name "website.log.[0-9][0-9]" -exec rm -f {} \
