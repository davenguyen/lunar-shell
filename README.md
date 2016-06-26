# Lunar shell

Lunar shell provides a command-line interface for any website. Check out
[inthenight.net](http://inthenight.net/) to see a live example.

This project was influenced by [XKCD CLI](http://uni.xkcd.com/).

## Getting Started

Add `lunar_shell` gem to your Gemfile and run `bundle`:

```ruby
gem 'lunar_shell', '~> 0.4.1'
```

Mount the engine in _config/routes_:

```ruby
Rails.application.routes.draw do
  mount LunarShell::Engine, at: "/shell"
end
```

While in development, we'll want to eager load so satellites like `help` can
function properly. Modify `config.eager_load` in
_config/environments/development.rb_:

```ruby
Rails.application.configure do
  # Do eager load code on boot.
  config.eager_load = true
end
```

Include the engine's assets in _application.js_ and _application.css_
(alternately, you can add this to your _application.html_ layout, just make sure
it goes before the call to your applications js/css file.):

```ruby
//= require jquery
//= require jquery_ujs
//= require lunar_shell/application
//= require_tree .
```

```ruby
 *
 *= require lunar_shell/application
 *= require_tree .
 *= require_self
 */
```

Then start your server and start typing!

## Satellites

To get the full effect of Lunar shell, you'll need to add _satellites_ to your
shell. Think of satellites as executable programs or scripts on a computer. The
more satellites you add, the more robust your shell would be. Check out the wiki
to [create your own satellites](https://github.com/davenguyen/lunar-shell/wiki/Hello,-Satellite!-(creating-your-first-satellite)).
