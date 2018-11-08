<<README
	@title
	@version
	@author
	@description
	@documentation

    syntax
        GLOBAL_SCOPE_VAR
        local_scope_var
        ExecutionCommandFunction
        helperFunction

README

#!/bin/bash

clear

DisplayHelp() {
  echo \\n"Documentation: ..."\\n
  echo "Basic usage: "\\n
  echo \\t"..."\\n  
  echo "Opts: "\\n
  echo \\t"-u (optional)"\\t"username for docker login"\\n
  echo \\t"-p (optional)"\\t"password for docker login"\\n
  echo \\t"-d (optional)"\\t"if opt arg equal 1, dual deployment runs"\\n
  exit 1
}

: '
while getopts :h FLAG; do
  case $FLAG in
    h) DisplayHelp ;;
  esac
done
'

while getopts :a opt; do
  case $opt in
    a)
      echo "-a was triggered!" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done