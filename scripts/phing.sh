#!/usr/bin/env bash

# Test if Phing is installed
phing -v > /dev/null 2>&1
PHING_IS_INSTALLED=$?

if [[ $PHING_IS_INSTALLED -ne 0 ]]; then
  echo ">>> Installing Phing"
	pear channel-discover pear.phing.info
	pear install phing/phing
else
  echo ">>> Updating Phing"
	pear upgrade phing/phing
fi
