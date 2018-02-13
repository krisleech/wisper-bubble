# Wisper::Bubble

Event bubbling for Wisper.

## Installation

```ruby
gem 'wisper-bubble'
```

## Usage

```ruby
class MyListener
  def on_it_happened
    puts "!!!"
  end
end

class FirstPublisher
  include Wisper::Publisher
  include Wisper::Bubble

  def call
    broadcast(:it_happened)
  end
end

class SecondPublisher
  include Wisper::Publisher

  def call
    first_publisher = FirstPublisher.new
    first_publisher.bubble(self)
    first_publisher.call
  end
end

second_publisher = SecondPublisher.new

second_publisher.subscribe(MyListener.new)

second_publisher.on(:it_happened) do |event|
  puts "Hello there: #{event}"
end

second_publisher.call
```

All the regular Wisper subscription options are supported, for example, to
bubble only selected events:

```ruby
publisher.bubble(self, on: :create_something_or_other)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krisleech/wisper-bubble.
