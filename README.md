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

Creates a new HAR attached to the proxy and returns the HAR content if there was a previous HAR

```ruby
@client.update_proxy_har(port, data)
```

Starts a new page on the existing HAR

```ruby
@client.update_proxy_har_pageref(port, data)
```

Shuts down the proxy and closes the port

```ruby
@client.remove_proxy
```

Returns the JSON/HAR content representing all the HTTP traffic passed through the proxy

```ruby
@client.get_proxy_har(port)
```

Displays whitelisted items

```ruby
@client.get_proxy_whitelist(port)
```

Sets a list of URL patterns to whitelist

```ruby
@client.update_proxy_whitelist(port, data)
```

Clears all URL patterns from the whitelist 

```ruby
@client.remove_proxy_whitelist(port)
```

Displays blacklisted items

```ruby 
@client.get_proxy_blacklist(port)
```

Set a URL to blacklist

```ruby
@client.update_proxy_blacklist(port, data)
```

Clears all URL patterns from the blacklist

```ruby
@client.remove_proxy_blacklist(port)
```

Limit the bandwidth through the proxy

```ruby
@client.update_proxy_limit(port, data)
```

Displays the amount of data remaining to be uploaded/downloaded until the limit is reached

```ruby
@client.get_proxy_limit(port)
```

Set and override HTTP Request headers

```ruby
@client.add_proxy_headers(port, data)
```

Overrides normal DNS lookups and remaps the given hosts with the associated IP address

```ruby
@client.add_proxy_hosts(port, data)
```

Sets automatic basic authentication for the specified domain

```ruby
@client.add_proxy_authentication(port, domain, data)
```

Wait till all request are being made 

```ruby
@client.update_proxy_wait(port, data)
```

Handles different proxy timeouts

```ruby
@client.update_proxy_timeout(port, data)
```

Redirecting URL's

```ruby
@client.update_proxy_redirect(port, data)
```

Removes all URL redirection rules currently in effect

```ruby
@client.remove_proxy_redirect(port)
```

Setting the retry count

```ruby
@client.add_proxy_retry_count(port, data)
```

Empties the Cache

```ruby
@client.remove_proxy_dns_cache(port)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/browsermob-rest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

