#!/bin/bash

DRUPAL_BRANCH=9.1.x
[ ! -d web ] && git clone --depth 1 --branch $DRUPAL_BRANCH https://git.drupalcode.org/project/drupal.git web
lando start

lando composer install
lando composer run-script drupal-phpunit-upgrade

echo "Running a PHPUnit-Unit test with run-tests.sh..."
echo "================================================"
lando run-tests --types "PHPUnit-Unit" --module action

echo "Running a Kernel test with phpunit..."
echo "================================================"
lando phpunit /app/web/core/modules/system/tests/src/Kernel/Action
