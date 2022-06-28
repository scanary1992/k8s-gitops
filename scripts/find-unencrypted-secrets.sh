#!/bin/sh
FILE_WITH_SECRETS=$(grep -lZRPi '^kind:\s+secret' . | xargs -r0 grep -L -e 'ENC.AES256' -e 'ENC.ED25519')
if [ -z "$FILE_WITH_SECRETS" ]; then
  exit 0
else
  echo "$FILE_WITH_SECRETS has unencrypted secrets! (or at least not encrypted with AES256 or Ed25519)"
  exit 1
fi
