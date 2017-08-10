$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "roguelytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "roguelytics"
  s.version     = Roguelytics::VERSION
  s.authors     = ["outten"]
  s.email       = ["outten@me.com"]
  s.homepage    = "http://www.roguestudios.io"
  s.summary     = "Summary of Roguelytics."
  s.description = "Description of Roguelytics."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'activejob', ">= 4.2"

  s.add_development_dependency "sqlite3"

  s.required_ruby_version = ">= 2.2.0"

end
