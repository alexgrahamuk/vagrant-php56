#!/usr/bin/env bash
echo ">>> Installing PHPUnit"

# Global install of PHPUnit 3.7 for CakePHP
curl -s -S https://phar.phpunit.de/phpunit-3.7.38.phar > phpunit
if [[ $? -eq 0 ]]; then
	mv phpunit /usr/bin/phpunit
else
	>&2 echo "Failed to install PHPUnit"
fi