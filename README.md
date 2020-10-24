# dotpath

dotpath gives you utilities to navigate and modify hashes and arrays in Ruby
with the JSON path to each value in the hash or array.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dotpath'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dotpath

## Usage

### Navigating hashes and arrays

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

array.each_with_json_path do |path, value|
  p [path, value]
end

# [".[0].action", "user.login"]
# [".[0].users[0].user", "olddewski"]
# [".[0].users[0].user_id", "1"]
# [".[0].users[1].user", "dewski"]
# [".[0].users[1].user_id", "2"]
```

### Selecting values from hashes and arrays using JSON paths

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

hash.value_at_path(".action") # => "user.login"
hash.value_at_path(".users[0].user") # => "olddewski"
hash.value_at_path(".users[0].user_id") # => "1"
hash.value_at_path(".users[1].user") # => "dewski"
hash.value_at_path(".users[1].user_id") # => "2"
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

array.value_at_path(".[0].action") # => "user.login"
array.value_at_path(".[0].users[0].user") # => "olddewski"
array.value_at_path(".[0].users[0].user_id") # => "1"
array.value_at_path(".[0].users[1].user") # => "dewski"
array.value_at_path(".[0].users[1].user_id") # => "2"
```

### Mutating hashes and arrays

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

hash.collect_with_json_path do |path, value|
  if path == ".action"
    value.gsub('.', '_')
  else
    value
  end
end

pp hash

# {
#   action: "user_login",
#   users: [
#     {
#       user: "olddewski",
#       user_id: "1"
#     },
#     {
#       user: "dewski",
#       user_id: "2"
#     },
#   ],
# }
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

array.collect_with_json_path do |path, value|
  if path == ".action"
    value.gsub('.', '_')
  else
    value
  end
end

pp array

# [
#   {
#     action: "user_login",
#     users: [
#       {
#         user: "olddewski",
#         user_id: "1"
#       },
#       {
#         user: "dewski",
#         user_id: "2"
#       },
#     ],
#   },
# ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dewski/dotpath. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dewski/dotpath/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the dotpath project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dewski/dotpath/blob/master/CODE_OF_CONDUCT.md).
