#!/bin/bash

#set -x

if [[ "$1" = "--add-require-dev" ]];
then
  # support the composer package syntax (drupal/the_module:version), as well as just the module name.
  MODULE_NAME=$(echo $2 | cut -d'/' -f 2 | cut -d':' -f 1)
  lando composer require --no-update $(cat web/modules/contrib/$MODULE_NAME/composer.json | jq -r '.["require-dev"] | to_entries | map(.key + ":" + .value) | join(" ")');
  # Only support doing one action at a time
  exit 0
fi
