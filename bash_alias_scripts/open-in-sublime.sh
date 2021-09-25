#!/bin/bash

# purpose: given a filename, open it in sublime.
# if the file does not exist, create it, then open it.

file=$1

if [ ! -e "$file" ] ; then
	touch "$file"
fi

open -a "Sublime Text" "$file"