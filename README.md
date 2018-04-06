# SimpleHubspot
[![Gem Version](https://badge.fury.io/rb/simple_hubspot.svg)](https://badge.fury.io/rb/simple_hubspot) [![Build Status](https://travis-ci.org/brenooliveira/simple_hubspot.svg?branch=master)](https://travis-ci.org/brenooliveira/simple_hubspot) [![Code Climate](https://codeclimate.com/github/brenooliveira/simple_hubspot/badges/gpa.svg)](https://codeclimate.com/github/brenooliveira/simple_hubspot)

SimpleHubspot Gem is a pure light-weight implementation for Hubspot API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_hubspot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_hubspot

## Usage

### Basic Usage

```ruby
require 'simple_hubspot'
```

Setting your `hapikey` you can create a new file in initializers from Rails.
To submit a form you need to add your `portal_id` to the configure file.

```ruby
rails g simple_hubspot:install
```

#### Without Rails

```ruby
SimpleHubspot.configure do |config|
  config.hapikey= "YOUR API KEY"
  config.portal_id = "YOUR PORTAL ID"
end
```

#### Create Or Update Contact

```ruby
SimpleHubspot::Contact.create_or_update "email@email.com", { name: "John", age: 14, country: 'BRAZIL' }
```

#### Find by e-mail
```ruby
SimpleHubspot::Contact.find_by_email "email@email.com"
```

#### Update Contact
```ruby
SimpleHubspot::Contact.update 1234,  { email: "email@email.com" }
```

#### Submit a Form
```ruby
payload = { email: 'test@example.com',
            property_one: 'value 1',
            property_two: 'value 2',
            hs_context: { hutk: '60c2ccdfe4892f0fa0593940b12c11aa',
                          ipAddress: '127.0.0.10',
                          pageUrl: 'http://demo.hubapi.com/contact/',
                          pageName: 'Contact Us' } }
SimpleHubspot::Form.submit_form 'FORM_GUID', payload
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/simple_hubspot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
