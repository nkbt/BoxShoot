#!/bin/bash

F_NAME=`date +%s | md5sum | awk '{ print $1}'`'.png'
DBOX_DIR='/home/username/Dropbox/Public/pic/'
DBOX_URL='http://dl.dropbox.com/u/2058666/pic/'
S_NAME=$DBOX_DIR$F_NAME

scrot -s -q 0 $S_NAME
echo -n $DBOX_URL$F_NAME | xclip