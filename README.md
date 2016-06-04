# Browsermob::Rest

[![Build Status](https://travis-ci.org/thamilton2014/browsermob-rest.svg?branch=master)](https://travis-ci.org/thamilton2014/browsermob-rest)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'browsermob-rest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browsermob-rest

## Usage

Starting the Browsermob Server (Optional)

```ruby
server = Browsermob::Server.new("path-to-jar", background: true)
server.start
# Do something 
server.stop
```

Configure the base url of your Browsermob proxy

```ruby
Browsermob::Rest::Util::Config.configure do |config|
    config[:endpoints][:base_url] = "example_url"
end
```

Create API client

```ruby
@client = Browsermob::Rest::Api.new
```

Get a list of ports attached to ProxyServer instances managed by ProxyManager

```ruby
@client.get_proxies
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/browsermob-rest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

