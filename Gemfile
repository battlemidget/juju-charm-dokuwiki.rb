# frozen_string_literal: true
source "https://rubygems.org"

gem "rake"
gem "rspec"
gem "charmkit", "~> 1.0"

gem "charmkit-scrolls-nginx", :github => "charmkit/charmkit-scrolls-nginx"
gem "charmkit-scrolls-php", :github => "charmkit/charmkit-scrolls-php"

# Bundletester will install its own mechanize via apt install ruby-mechanize
# see hooks/install for the bundle command we run without development on our production
# charm.
#
# This is useful for running our local tests/* before uploading to charm store
gem 'mechanize', :group => :development
