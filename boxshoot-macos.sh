#!/bin/bash

FILE_NAME=`date +%Y%m%d-%H%M%S`'.png'
DROPBOX_DIR='/Users/nkbt/Dropbox/Public/Screenshot/'
DROPBOX_URL='http://dl.dropbox.com/u/000000/Screenshot/'
DATE_DIR=`date +%Y-%m`
mkdir -p $DROPBOX_DIR$DATE_DIR
FILE_PATH=$DROPBOX_DIR$DATE_DIR\/$FILE_NAME

screencapture -i $FILE_PATH

echo -n $DROPBOX_URL$DATE_DIR\/$FILE_NAME | pbcopy
