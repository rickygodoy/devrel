#!/bin/bash

# Install the check-jsonschema package in Python first
if ! command -v check-jsonschema &> /dev/null; then
  echo "Error: check-jsonschema is not installed. Please install it using 'pip install check-jsonschema'."
  exit 1
fi

exit_code=0

while IFS= read -r -d $'\0' file; do
  echo -e "Validating ${file}..."
  if ! find src -type f -name "$(basename ${file%%.*})*" -print0 | xargs -0r -- check-jsonschema --schemafile "$file"; then
    exit_code=1
  fi
done < <(find schemas -maxdepth 1 -type f -name "*.schema.json" -print0)

exit $exit_code
