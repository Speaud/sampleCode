# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-11.html

# if directory exists
if [ ! -d "$BUILD_DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo 'app dir not found'
  exit 1
fi

# (a)
if [ $USE_DEFAULT_VERSIONING_LOGIC != "y" ]; then
    echo "invalid"
fi

# shorthand for (a)
[ $USE_DEFAULT_VERSIONING_LOGIC != "y" ] && ( echo you are using a non-privileged account; exit 1 )
# nested if else
[ $(date +%w) -eq 6 ] && {echo "do something on Saturdays"; do_some_other_stuff; exit 0;} || echo "do different things on other days"

if [ "$seconds" -eq 0 ]; then
   timezone_string="Z"
elif [ "$seconds" -gt 0 ]; then
   timezone_string=$(printf "%02d:%02d" $((seconds/3600)) $(((seconds / 60) % 60)))
else
   echo "Unknown parameter"
fi
