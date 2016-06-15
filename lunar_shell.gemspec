$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lunar_shell/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lunar_shell"
  s.version     = LunarShell::VERSION
  s.authors     = ["Dave Nguyen"]
  s.email       = ["Dave.Nguyen@inthenight.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LunarShell."
  s.description = "TODO: Description of LunarShell."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
