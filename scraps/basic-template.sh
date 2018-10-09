<<README

	@title
	@version
	@author
	@description
	@documentation

README
#!/bin/bash

#Help function
function HELP {
  echo -e \\n"Documentation: "\\n
  echo -e "Basic usage: "\\n
  exit 1
}

while getopts :h FLAG; do
  case $FLAG in
    h)  #show help
      HELP
		;;
  esac
done

: '
  multiple
  line
  comment
'

clear

## "normalize" file paths
#	ideal dir struct
#	/
#		bin
#		dev
#		etc
#		lib
#		src
#		tmp
ROOT=$(PWD)
TMP=$ROOT/tmp
ETC=$ROOT/etc
BIN=$ROOT/bin
SRC=$ROOT/src


## declare conf file
. $SRC/globals/glob_vars
. $FUNC/globals/glob_func
. $ETC/debug

## declare and include script dependencies

#####

	# init method here
	
#####
