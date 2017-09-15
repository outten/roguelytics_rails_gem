
Roguelytics
===========

## Documentation valid for `master` branch

- [Requirements](#requirements)
  - [Ruby and Rails](#ruby-and-rails)
  - [ActiveJob](#activejob)
- [Installation](#installation)
- [Quick Start](#quick-start)
  - [Sign Up](#sign-up)
  - [Configuration](#configuration)
  - [View Helper For Page Tracking](#view-helper-for-page-tracking)
  - [Business Object Monitoring](#business-object-monitoring)
- [OpenSSL Errors](#openssl-errors)
- [Contributing](#contributing)
- [License](#license)
- [About Rogue Studios](#about-rogue-studios)


[Roguelytics](https://www.roguelytics.com?utm_source=github) The Only TRUE On-Page Analytics Platform

### On-Page and Never Out of Sight. 
Logging into separate portals is a thing of the past. By natively placing analytics on-page, your analytics are never out of sight or out of mind. 

### Real-Time. 
Return relevant, big picture data focusing on common goals most important to you, in real-time, all the time. 

### Simplified. 
Accurate and simple user-friendly goal-driven data that provides actionable insights. No more second-guessing “if you’re reading the numbers right”.

### Goal Orientated & Actionable. 
Understand and relay current user behaviors, and lend to anticipating customer trends or shifts in buyer behavior.

### Dive-Deeper
Top-line on-page consumer dashboard coupled with the ability to drill-drown into the supporting data through a simple user-friendly platform.

### Path Navigation & Playback
See how users navigate and where they fall off or get stuck. Identify usability issues by watching recordings of real visitors as they click, tap, type and navigate across pages.

Roguelytics was created by [RogueStudios](https://www.roguestudios.com?utm_source=github).

Requirements
------------

### Ruby and Rails

Roguelytics requires Ruby version **>= 2.2.0** and Rails version **>= 4.2.1**

### ActiveJob

Roguelytics uses ActiveJob version **>= 4.2**

Installation
------------

Roguelytics is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

```ruby
gem "roguelytics"
```

Quick Start
-----------

### Sign Up

To install Roguelytics to your website, you will need to sign up for an account and generate a key and install unique tracking code before Roguelytics will track your site(s).

Sign Up by visiting: [Roguelytics](https://www.roguelytics.com/sign_up?utm_source=github).

*Step 1*: Add A Site - Create a name by adding a new site. This will generate your keys and tracking code. Add multiple sites the same way –tracking code is unique per site.  

*Step 2*: Add Tracking Code - Under your Network of sites you’ll find your “Production” environment Key. This is your unique tracking code that goes into your SEO or Footer Files on your website. Simply copy and paste! 

*Step 3*: Utilize Multiple Environments (optional) - Multiple environments are already created so you can create and build within testing, staging, and production environments with unique environment variables for each.

*Step 4*: Add Additional Users -  Only those who have credentials and sign-in to Roguelytics can see your on-page analytics. For others within your organization have access and be able to view drawer and portal, you will need to invite them. Once invited, they will need to register or sign up. 


### Configuration

After you sign-up and get your guys, create a configuration file: config/initializers/roguelytics.rb

```ruby
#
# Roguelytics Initializer
#
ROGUELYTICS_SITEKEY = '<production key>' if Rails.env.production?
ROGUELYTICS_SITEKEY = '<staging key>' if Rails.env.staging?
ROGUELYTICS_SITEKEY = '<development key>' if Rails.env.development?
ROGUELYTICS_SITEKEY = '<qa key>' if Rails.env.qa?
ROGUELYTICS_SITEKEY = '<test key>' if Rails.env.test?
```

Add your site's KEYS to this file for each environment.

### View Helper For Page Tracking

The GEM provides a view helper *rogueltyics* that should be included in layouts for each page you want tracked. Just incuded the view helper in the layout right before the closing *body* tag. See below:

```ruby
<!DOCTYPE html>
<html>
<head>
	<title>Roguelytics Test Rails Application for Gem</title>
	<%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
	<%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
	<%= csrf_meta_tags %>
</head>
<body>
	<%= yield %>
	<%= roguelytics %>
</body>
</html>
```

### Business Object Monitoring

For each model that you want Roguelytics to monitor, add the following two lines:

```ruby
class Article < ActiveRecord::Base
	include Roguelytics::HasRoguelytics
	has_roguelytics
end
```

Roguelytics create an ActiveJob for each of the following actions: CREATE, UPDATE, DELETE. 

Note: when running in *DEVELOPMENT* mode, the ActiveJob will run in the foreground (perform now). In all other modes, it will be enqueued and run later (perform later). You must setup ActiveJob with a backend. Instructions are [here](http://edgeguides.rubyonrails.org/active_job_basics.html)

The GEM will pass the object's class name and ID to Roguelytics. If the model responds to "name", the name of the model will also be passed and can be used for reporting.

OpenSSL Errors
--------------

In *development* mode on a Mac, you may get the following error:


```ruby
SSL_connect returned=1 errno=0 state=error: certificate verify failed
```

If you get this error, you can add the following to your configuration file: config/initializers/roguelytics.rb

```ruby
if Rails.env.development? #or Rails.env.staging?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end
```

Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! Send us an email: developers@roguestudios.io


License
-------

Paperclip is Copyright © 2017 Rogue Studios, LLC. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.

About Rogue Studios
-------------------

Roguelytics GEM is maintained and funded by Rogue Studios.
The names and logos for thoughtbot are trademarks of Rogue Studios, LLC.

[RogueStudios](https://www.roguestudios.com?utm_source=github)