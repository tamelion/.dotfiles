#!/bin/bash

## Jimi's webroot permissions script

echo Setting folder permissions to 2775
find . -type d -exec chmod 2775 {} \;

echo Setting file permissions to 0664
find . -type f -exec chmod 0664 {} \;

echo Setting user and group permissions to james:www-data
chown -R james:www-data .

echo Done.
