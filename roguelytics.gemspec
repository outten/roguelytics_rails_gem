$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "roguelytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "roguelytics"
  s.version     = Roguelytics::VERSION
  s.authors     = ["Todd Outten"]
  s.email       = ["todd@roguestudios.io"]
  s.homepage    = "https://github.com/outten/roguelytics_rails_gem"
  s.summary     = "Rogueyltics is an Web Page and Business Model/Object Analytics Package for Ruby on Rails."
  s.description = "Roguelytic’s platform uniquely offers  on-page analytics. Unlike other platforms, Roguelytics does not require users to login to separate sites, as well as simplifying data for user-friendly consumption. By enhancing the usability and functionality of data, we equip customers with the tools to understand, track, forecast, and interpret user behavior and activity.  Through clarity and simple metrics, customers can quickly make more accurate business decisions rather than second guessing if they’re understanding or interpreting metrics correctly."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'activejob', ">= 4.2"

  s.add_development_dependency "sqlite3"

  s.required_ruby_version = ">= 2.2.0"

end
