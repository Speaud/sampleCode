# if directory exists
if [ ! -d "$BUILD_DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo 'app dir not found'
  exit 1
fi