#!/bin/bash
#
# Create a link on a .dotfile into the current user $HOME
# 
# The MIT License (MIT)
#
# Copyright (c) 2013 Emmanuel Pinault
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# usage: ./link.sh <config_dir>
#   ./link.sh git
#

[ -z "$CONFIG_HOME" ] && CONFIG_HOME=$PWD

if env | grep -q ^CONFIG_HOME=
then
  echo "CONFIG_HOME is already specified, using ${CONFIG_HOME}"
fi

if [ -z $1 ]
then
	echo "Missing argument"
	exit 1
fi

if [ ! -d "$CONFIG_HOME/$1" ]
then
	echo "Not a valid config"
	exit 1
fi

for i in $(ls $CONFIG_HOME/$1/* | grep symlink)
do
	filename=`basename $i`
	filename=.${filename/.symlink/}
	echo "Created a link for $i in $HOME/$filename"
	ln -s $i $HOME/$filename
done