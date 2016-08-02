<<README

	@title
	@version
	@author
	@description
	@documentation

README

#!/bin/bash
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
