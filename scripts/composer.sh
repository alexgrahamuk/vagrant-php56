#!/usr/bin/env bash

# Test if Composer is installed
/usr/local/bin/composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?
# True, if composer is not installed
if [[ $COMPOSER_IS_INSTALLED -ne 0 ]]; then
  echo ">>> Installing Composer"
  # Install Composer
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
else
  echo ">>> Updating Composer"

  /usr/local/bin/composer self-update
fi