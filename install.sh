#!/bin/sh

# This script does a full reset/init of the local ruby environment needed for developing on your gem 

if [ "$1" == "--clean" ]; then
  rm -rf ~/.bundle
  rm -rf ~/.gem/ruby
  rm -rf ~/.gem/specs
fi

# Install Bundler
gem install bundler --user-install
grep -qF '.gem/ruby/2.3.0/bin' ~/.profile || echo export PATH="\$PATH:$HOME/.gem/ruby/2.3.0/bin" >> ~/.profile
bundle config set path "$HOME/.gem"

# Download project dependencies
bundler install

