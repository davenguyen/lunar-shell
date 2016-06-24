# Lunar shell

Lunar shell provides a command-line interface for any website. Check out
[the demo](https://lunarshell.herokuapp.com/) or
[inthenight.net](http://www.inthenight.net/) for examples.

This project was influenced by [XKCD CLI](http://uni.xkcd.com/).

## Getting Started

Add `lunar_shell` gem to your Gemfile:

```ruby
gem 'lunar_shell', '~> 0.2.0'
```

Mount the engine in `config/routes`:

```ruby
Rails.application.routes.draw do
  mount LunarShell::Engine, at: "/shell"
end
```

Then start your server and start typing!

## Satellites

To get the full effect of Lunar shell, you'll need to add _satellites_ to your
shell. Think of satellites as executable programs or scripts on a computer. The
more satellites you add, the more robust your shell would be. Check out the wiki
to [create your own satellites](https://github.com/davenguyen/lunar-shell/wiki/Hello,-Satellite!-(creating-your-first-satellite)).
