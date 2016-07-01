# Opal ProseMirror

[![Build Status](https://travis-ci.org/ajjahn/opal-prosemirror.svg?branch=master)](https://travis-ci.org/ajjahn/opal-prosemirror)

Opal ProseMirror aims to be a *reasonable* wrapper around
[ProseMirror](https://github.com/prosemirror/prosemirror). ProseMirror has a
large API. This project currently only wraps a subset of it. Pull requests to
add more surface area to the API are welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opal-prosemirror'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opal-prosemirror

## Usage

```ruby
require 'opal' # Not necessary if you load Opal from a CDN
require 'prose_mirror'
```

## Contributing

1. Fork it ( https://github.com/ajjahn/opal-prosemirror/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
