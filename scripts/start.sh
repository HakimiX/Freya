#!/bin/sh

# Install dependencies (MacOS)
brew install leiningen
brew install terraform@1.2
echo 'export PATH="/usr/local/opt/terraform@1.2/bin:$PATH"' >> ~/.zshrc
brew install awscli

# Install dependencies (Ubuntu)
# todo...
