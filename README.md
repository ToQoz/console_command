
# ConsoleCommand

This Rails plugin is enable to add command easily to `rails console` even if it is using which of pry and irb.

## Usage

In your Gemfile.

```ruby
group :development do
  gem "console_command"
end
```

and puts ruby script as follows in `config/console_command/`. Some examples are in [examples/](https://github.com/ToQoz/console_command/tree/master/examples)

```ruby
# config/console_command/what_time_is_it_now.rb
# CC aliased to ConsoleCommand
CC.define_command('what-time-is-it-now') do |c|
  c.description "display current time" # this infomation is used only by pry
  c.group "Joke"                       # this infomation is used only by pry
  c.options do |opts|                  # this infomation is used only by pry
    opt.banner unindent <<-USAGE
      Usage: what-time-is-it-now

      display what-time-is-it-now
    USAGE
  end
  c.process do
    puts Time.now
  end
end
```

and start rails console and execute command.

**If you use irb for `rails console`, hyphen in command name is automatically converted to underscore.** Because we can't use hyphen for command name in irb

```sh
# with pry
$ rails console
[1] pry(main)> what-time-is-it-now
2012-12-22 17:26:26 +0900
[2] pry(main)> help
...
Joke
  what-time-is-it-now display current time
...

# with irb
$ rails console
irb(main):001:0> what_time_is_it_now
2012-12-22 17:26:26 +0900
```
