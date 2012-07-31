# Czech declensions

Czech declensions were rewritten from Javascript from original site [pteryx.net](http://pteryx.net/sklonovani.html)
by author Pavel Sedlak under LGPL 2.1. Actual version is 0.96b.

## Installation

### From Git

You can check out the latest source from git:

    git clone git://github.com/dominikform/czech_declensions.git

### From RubyGems

Installation from RubyGems

    gem install czech_declensions

Alternatively, add the following to your Gemfile

    gem 'czech_declensions', :git => 'git://github.com/dominikform/czech_declensions.git'

## Usage

    slovo = CzechDeclensions.sklonovani("moje slovo",2) => "mojeho slova"

## Contributing

The source code is hosted at [GitHub](http://github.com/dominikform/czech_declensions), and can be fetched using:

    git clone git://github.com/dominikform/czech_declensions.git

Please don't touch the CHANGELOG in your pull requests, we'll add the appropriate CHANGELOG entries
at release time.

[![Build Status](https://secure.travis-ci.org/Shopify/active_merchant.png)](http://travis-ci.org/Shopify/active_merchant)
