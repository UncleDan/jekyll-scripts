#!/bin/sh

SITE=$1

if [ "$SITE" = "" ]
then
    echo "USAGE: buildsite <sitefolder>.";
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
    echo "Folder '$SITE' does not seem to be a valid Jekyll site.";
    echo;
    exit 1
fi

cd $SITE
if [ ! -e ".hydejack" ]
then
    jekyll build;
else
    echo "Hydejack theme detected.";
    JEKYLL_ENV=production bundle exec jekyll build;
    echo;
fi
echo;
cd ..

