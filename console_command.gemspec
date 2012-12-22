$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "console_command/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "console_command"
  s.version     = ConsoleCommand::VERSION
  s.authors     = ["Takatoshi Matsumoto"]
  s.email       = ["toqoz403@gmail.com"]
  s.homepage    = "http://github.com/ToQoz/console_command"
  s.summary     = "This is Rails plugin provides DSL for adding command in `rails console` (pry and irb.)"
  s.description = "This Rails plugin is enable to add command easily to `rails console` even if it is using which of pry and irb"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
