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

# fiqure out a short cut, with logical syntax, to work around this shit