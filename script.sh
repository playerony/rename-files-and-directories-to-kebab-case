read -p "Target directory: " targetDirectory

if [ -z "$targetDirectory" ]; then
  echo 'Error: Target directory was not specified.'

  exit 1
fi

if [ -d "$targetDirectory" ]; then
  echo "Info: '$targetDirectory' found and now kebabing files and directories..."

  cd $targetDirectory
  echo "Info: Changed directory to '${targetDirectory}'."

  for file in *
  do
    newFilename=$(echo $file | sed -r 's/([a-z])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')

    mv $file $newFilename
    echo "Info: Rename '$file' to '$newFilename'"
  done
else
  echo "Error: '$targetDirectory' directory not found."
fi
