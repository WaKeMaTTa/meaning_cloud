# MeaningCloud

Meaning Cloud Ruby API Wrapper

[![Build Status](https://travis-ci.org/WaKeMaTTa/meaning_cloud.svg?branch=master)](https://travis-ci.org/WaKeMaTTa/meaning_cloud)

This gem is a ruby API wrapper for [Meaning Cloud](https://www.meaningcloud.com/) [API's](https://www.meaningcloud.com/developer/getting-started).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meaning_cloud'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install meaning_cloud
```

## Usage

### Pre-requirement

You need a valid `key` to use the gem. You can get it by signing up [here](https://www.meaningcloud.com/developer/getting-started).

If you don't set the `key` it will *raises an exception*.

### Configuration

You can use add initializer for example if you're on Rails.

```ruby
# config/initializers/meaning_cloud.rb

MeaningCloud.configure do |config|
  config.key = ENV['MEANING_CLOUD_KEY']                       # REQUIRED
  config.language = :en                                       # optional, default is :en
  config.topic_types = 'ec'                                   # optional, default is 'ec'
  config.api_base = 'https://api.meaningcloud.com/topics-2.0' # optional, default is 'https://api.meaningcloud.com/topics-2.0'
end
```

### Extract topics

```ruby
# Returns a hash of the parsed JSON result.
result = MeaningCloud::Topics.extract_topics(txt: 'The most amazing text in the world')
```
Source [source](https://www.meaningcloud.com/developer/topics-extraction/doc/2.0/examples)

## Status of the gem

Current version only wraps the Topics extraction API's and is focused on specific usage. Feel free to send a pull request with more API's wrapped!

The current gem is based in [TailorBrands/meaning-cloud](https://github.com/TailorBrands/meaning-cloud)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [meaning_cloud repository](https://github.com/wakematta/meaning_cloud). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MeaningCloud project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/meaning_cloud/blob/master/CODE_OF_CONDUCT.md).
