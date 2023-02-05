# Toktokkie

## Installation
Install the gem and add to the application's Gemfile by executing:

    $ bundle add toktokkie

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install toktokkie

## Configuration
```ruby
Toktokkie.configure do |config|
  config.key = "[YOUR_API_KEY]"
  config.secret = "[YOUR_API_SECRET]"
end
```

## Usage
```ruby
client = Toktokkie.client
client.create_event(
  # required
  payload: {
    title: "New comment",
    body: "Charles commented on your blog post!",
    action: {
      "text": "View comment",
      "url": "https://www.example.com/blog/1/comments#comment-2"
    }
  },
  # required
  recipients_payload: [
    { external_id: "users-12345" }
  ],
  # optional
  tags: ["Inbox A", "Inbox B"]
)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TokTokkieOrg/toktokkie_rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
