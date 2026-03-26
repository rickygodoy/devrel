#!/bin/bash

if ! bash validate_schema.sh; then
  echo "Schema validation failed. Aborting."
  exit 1
fi

echo "Schema validation successful. Proceeding with next steps."
