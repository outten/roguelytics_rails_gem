
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


[Roguelytics](https://www.roguelytics.com?utm_source=github) platform uniquely offers  *on-page analytics*. Unlike other platforms, Roguelytics does not require users to login to separate sites, as well as simplifying data for user-friendly consumption. By enhancing the usability and functionality of data, we equip customers with the tools to understand, track, forecast, and interpret user behavior and activity.  Through clarity and simple metrics, customers can quickly make more accurate business decisions rather than second guessing if they’re understanding or interpreting metrics correctly.

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

Sign Up for an account at [Roguelytics](https://www.roguelytics.com/sign_up?utm_source=github).

Create a SITE to get your KEYS.


### Configuration

The GEM comes with a generator that creates an initializer file for 

```ruby
rails generate roguelytics
```

After you run the generator, a confiration file will be created: config/initializers/roguelytics.rb

Add your site's KEYS to this file.

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