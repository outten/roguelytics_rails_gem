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
  s.description = "
The Only TRUE On-Page Analytics Platform

On-Page and Never Out of Sight. 
Logging into separate portals is a thing of the past. By natively placing analytics on-page, your analytics are never out of sight or out of mind. 

Real-Time. 
Return relevant, big picture data focusing on common goals most important to you, in real-time, all the time. 

Simplified. 
Accurate and simple user-friendly goal-driven data that provides actionable insights. No more second-guessing “if you’re reading the numbers right”.

Goal Orientated & Actionable. 
Understand and relay current user behaviors, and lend to anticipating customer trends or shifts in buyer behavior.

Dive-Deeper
Top-line on-page consumer dashboard coupled with the ability to drill-drown into the supporting data through a simple user-friendly platform.

Path Navigation & Playback
See how users navigate and where they fall off or get stuck. Identify usability issues by watching recordings of real visitors as they click, tap, type and navigate across pages.

Quick Start 
To install Roguelytics to your website, you will need to sign up for an account and generate a key and install unique tracking code before Roguelytics will track your site(s).

Sign Up by visiting: https://www.roguelytics.com/sign_in 

Step 1: Add A Site - Create a name by adding a new site. This will generate your keys and tracking code. Add multiple sites the same way –tracking code is unique per site.  

Step 2: Add Tracking Code - Under your Network of sites you’ll find your “Production” environment Key. This is your unique tracking code that goes into your SEO or Footer Files on your website. Simply copy and paste! 

Step 3: Utilize Multiple Environments (optional) - Multiple environments are already created so you can create and build within testing, staging, and production environments with unique environment variables for each.

Step 4: Add Additional Users -  Only those who have credentials and sign-in to Roguelytics can see your on-page analytics. For others within your organization have access and be able to view drawer and portal, you will need to invite them. Once invited, they will need to register or sign up. 
"

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'activejob', ">= 4.2"

  s.add_development_dependency "sqlite3"

  s.required_ruby_version = ">= 2.2.0"

end
