#!/bin/sh 
sudo rsync -v -r --delete test/_site/* /srv/www/htdocs/
