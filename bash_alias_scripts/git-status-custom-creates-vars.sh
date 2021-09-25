#!/bin/bash

# todo:
#   Q: I'm not sure this could be done without editting .bashrc every time the script runs.
#   Re: https://stackoverflow.com/questions/42273519/how-to-export-variables-from-shell-script
#   looks like the answer is to source a script that exports the variables.
#   I could have this script build a file with the required variables, the source them.

# I want to check my git status and then be able to commit files without typing
# or copy-pasting their names.

# This script will do a git status, filter thru the status, detect filenames of
# modified files, and generate environment variables which can be
# used in a subsequent git commit.

# Each time this script is run, it should delete any such variables which may have
# been left over from its previous runs.


# varfile <-- location of a file that exports variables
# delete the varfile, to clean up variables from the last time this script ran
# create a new, empty varfile
# output <--- result of git status
# for each line of output:
#   if line matches regex for: "[any number of spaces]modified:[any num spaces][filename]"
#     extract filename from that line
#     append a line to the varfile to declare and export that filename as a variable
#			add an indicator to the line of output to show the variable name
# 		display the line of output, preserving coloring:
#				red coloring if it is a modified file line
#				green coloring if it a file staged for commit

varfile="/Users/$USER/DeveloperScripts/bash_alias_scripts/.git-status-custom-creates-vars-varfile-resource.sh"
echo "#!/bin/bash -e" > "$varfile" # replaces its existing contents, also use export mode

reminder1=$(echo "(use \"git add <file>...\" to update what will be committed)")
reminder2=$(echo "(use \"git restore <file>...\" to discard changes in working directory)")
reminder3=$(echo "(use \"git restore --staged <file>...\" to unstage)")

COLOR='\033[1;32m'
NC='\033[0m' # No Color

varnum=-1
# ((varnum = varnum + 1))
# echo $varnum

git status | while read line ; do

	 # ignore annoying git reminders
   if [[ "$line" != "$reminder1" && "$line" != "$reminder2" && "$line" != "$reminder3" ]]; then
   	
   	# Initial output will be staged files shown in green; when we get to unchanged files,
   	# change the color to red.
   	if [[ "$line" == "Changes not staged for commit:"* ]]; then
   		COLOR='\033[0;31m'
   	fi

   	# Lines that indicate a modified file will appear in color
   	if [[ "$line" == "modified:"* ]]; then
   	 # add an exported variable to the varfile
   	 ((varnum=varnum+1))
   	 # export TEST="hello world"
   	 fileName=$(echo ${line:11})
   	 varline="export g$varnum=\"$fileName\""
   	 # echo "$varline"
   	 echo "$varline" >> "$varfile"
   	 # the modified file lines will appear slightly indented from the left,
   	 # and the variables for each will appear lined up on the right.
   	 # The number of spaces in between the end of the filename and the variable
   	 # for each line must be some standard number less the length of the git output line. 
     spaces=$(echo -n $line | wc -m)
     ((spaces=75-spaces))
     FMT="\t${COLOR}%s%*s\n${NC}"
     printf $FMT "$line" $spaces "\$g$varnum"
    else
    	FMT="%s\n"
    	printf $FMT "$line"
   	fi
 	 
 	 	# printf $FMT "$line"
 	 
 	 fi


done



