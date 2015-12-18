# EmailLoginLink

This gem is designed to answer two extremely basic questions when provided with an email address.

1. Is there a known login URL for the relevant e-mail provider
2. If so, what is the URL?

It's development is inspired by a tweet from Patrick McKenzie a.k.a @patio11 on Twitter / Hacker News

![Tweet from @patio11](http://i.imgur.com/3S7NHcT.png "It's not strictly a microservice I know")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_login_link'
```

Or alternatively you can use:

```ruby
gem 'email_login_link', :git => "git://github.com/mhoad/email_login_link.git"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_login_link

## Usage

To check if a email address has a known login URL associated with it simply type:

```ruby
EmailLoginLink.known_login_url?("example@gmail.com")
```

To return the login URL associated with a given email address (assuming one exists) type:

```ruby
EmailLoginLink.login_url("example@gmail.com")
```

Note: This gem also has the ability to check custom domains (i.e. non-free e-mail accounts) to see if they are configured
to use Google Apps for Your Domain. In the instance that an email address meets this criteria the appropriate login URL 
will be returned such as:

    http://mail.google.com/a/#{domain}"

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mhoad/email_login_link.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

