#!/bin/sh

SITE=$1

if [ "$SITE" = "" ]
then
    echo "USAGE: publocal <sitefolder>.";
    echo;
    exit 1
fi        

if [ ! -d "$SITE" ]
then
    echo "Folder '$SITE' does not exist.";
    echo;
    exit 1
fi

if [ ! -e "$SITE/_config.yml" ]
then
    sudo rsync -v -r --delete $SITE/* /srv/www/htdocs/
else
    sudo rsync -v -r --delete $SITE/_site/* /srv/www/htdocs/
fi
echo;



