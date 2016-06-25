$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lunar_shell/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lunar_shell"
  s.version     = LunarShell::VERSION
  s.authors     = ["Dave Nguyen"]
  s.email       = ["Dave.Nguyen@inthenight.net"]
  s.homepage    = "http://inthenight.net"
  s.summary     = "A command-line interface for today's web"
  s.description = "For those who think there's too much clicking involved in surfing the web, Lunar shell offers a command-line interface to interact with the website."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "bcrypt",       "~> 3.1"
  s.add_dependency "coffee-rails", "~> 4.1"
  s.add_dependency "jquery-rails", "~> 4.1"
  s.add_dependency "rails",        "~> 4.2"
  s.add_dependency "sass-rails",   "~> 5.0"

  s.add_development_dependency "capybara",            "~> 2.7"
  s.add_development_dependency "chromedriver-helper", "~> 1.0"
  s.add_development_dependency "pg",                  "~> 0.18"
  s.add_development_dependency "selenium-webdriver",  "~> 2.53"
end
