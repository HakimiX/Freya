#!/bin/sh

OS=$1

if [ "$OS" == "--mac" ]; then
  echo "Installing dependencies for MacOS using homebrew..."
  brew install leiningen
  brew install terraform@1.2
  echo 'export PATH="/usr/local/opt/terraform@1.2/bin:$PATH"' >> ~/.zshrc
  brew install awscli
elif [ "$OS" == "--ubuntu" ]; then
  echo "Installing dependencies for Ubuntu using apt..."
  # todo...
elif [ "$OS" == "" ]; then
  echo "Please provide your OS, i.e. --mac or --ubuntu"
fi

exit 0
