#!/bin/bash
# fetch all the steven universe transcripts from springfieldspringfield and
# put them in one big file for searching!
# TODO: using this https://steven-universe.fandom.com/wiki/Category:Transcripts
# which links to stuff like this: https://steven-universe.fandom.com/wiki/Cooking_with_Lion/Transcript
# would give us speakers! which sfsf doesn't have, but it'd be harder to parse!

scripts=`curl https://www.springfieldspringfield.co.uk/episode_scripts.php\?tv-show\=steven-universe-2013`
rellinks=`echo "$scripts" | grep 'view_episode_scripts.php?tv-show=steven-universe-2013&episode=s..e..' -o`
links=`echo "$rellinks" | sed 's|^|https://www.springfieldspringfield.co.uk/|'`
html=`wget -O /dev/stdout $links`
html2text <(echo "$html") > all_scripts

