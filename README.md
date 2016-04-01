# Pingilish

pinglish gem converts Persian/farsi text to english and vice versa.

This gem is an improvements of the efforts made by [Aziz](https://github.com/aziz/pingilish.git).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pingilish'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pingilish

## Usage

```ruby
# farsi to english
Pingilish.to_default("توانا بود هرکه دانا بود")
 => "toana bod hrkh dana bod"


 # english to farsi
 Pingilish.to_farsi("nabordeh ranj ganj moiasar namishawad")
 => "نبرده رنج گنج میسر نمیشود "
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This gem requires a lot of improvments so bug reports and pull requests are welcome.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

