# Json::Path

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/json/path`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json-path'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install json-path

## Usage

json-path gives you utilities to navigate hashes and arrays in Ruby with the
JSON path to each value in the hash or array.

**Hash**

```ruby
hash = {
  action: "user.login",
  users: [
    {
      user: "olddewski",
      user_id: "1"
    },
    {
      user: "dewski",
      user_id: "2"
    },
  ],
}

hash.each_with_json_path do |path, value|
  p [path, value]
end

# [".action", "user.login"]
# [".users[0].user", "olddewski"]
# [".users[0].user_id", "1"]
# [".users[1].user", "dewski"]
# [".users[1].user_id", "2"]
```

**Array**

```ruby
array = [
  {
    action: "user.login",
    users: [
      {
        user: "olddewski",
        user_id: "1"
      },
      {
        user: "dewski",
        user_id: "2"
      },
    ],
  },
]

hash.each_with_json_path do |path, value|
  p [path, value]
end

# [".[0].action", "user.login"]
# [".[0].users[0].user", "olddewski"]
# [".[0].users[0].user_id", "1"]
# [".[0].users[1].user", "dewski"]
# [".[0].users[1].user_id", "2"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/json-path. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/json-path/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Json::Path project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/json-path/blob/master/CODE_OF_CONDUCT.md).
