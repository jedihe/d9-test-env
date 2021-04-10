#!/bin/bash

#set -x

if [[ "$1" = "--add-require-dev" ]];
then
  # Support both drupal/the_module:VERSION syntax, as well as just the module name.
  # We do it by nesting ${2%:*} (removes ':VERSION' suffix), then doing ${VAR#*/} (removes 'drupal/' prefix).
  MODULE_NAME=$(echo ${${2%:*}#*/})
  lando composer require --no-update $(cat web/modules/contrib/$MODULE_NAME/composer.json | jq -r '.["require-dev"] | to_entries | map(.key + ":" + .value) | join(" ")');
  # Only support doing one action at a time
  exit 0
fi
