#!/bin/sh

# Options
# Install dependencies (MacOS)
# $ ./install-dependencies.sh --mac
# Install dependencies (Ubuntu)
# $ ./install-dependencies.sh --ubuntu

OS=$1

if [ "$OS" == "--mac" ]; then
  echo "Installing dependencies for MacOS using homebrew..."
  #brew install leiningen
  #brew install terraform@1.2
  #echo 'export PATH="/usr/local/opt/terraform@1.2/bin:$PATH"' >> ~/.zshrc
  #brew install awscli
elif [ "$OS" == "--ubuntu" ]; then
  echo "Installing dependencies for Ubuntu using apt..."
  # todo...

fi

exit 0
