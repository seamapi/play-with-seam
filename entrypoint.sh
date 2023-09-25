#!/bin/bash

CHOSEN_LANGUAGE=$1

case "$CHOSEN_LANGUAGE" in
python)
    cd /app/python
    pip3 install seamapi
    ;;
ruby)
    cd /app/ruby
    gem install seamapi
    ;;
node)
    cd /app/node
    npm install seamapi
    ;;
*)
    echo "Unsupported language: $CHOSEN_LANGUAGE"
    exit 1
    ;;
esac

# Execute vscodium
exec code-server
