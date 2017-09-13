
Roguelytics
===========

## Documentation valid for `master` branch

Please check the documentation for the paperclip version you are using:
https://github.com/thoughtbot/paperclip/releases

- [Requirements](#requirements)
  - [Ruby and Rails](#ruby-and-rails)
  - [ActiveJob](#activejob)
- [Installation](#installation)
- [Quick Start](#quick-start)
  - [Sign Up](#sign-up)
  - [Configuration](#configuration)
  - [View Helper](#view-helper)
  - [Models](#models)


Paperclip is intended as an easy file attachment library for ActiveRecord. The
intent behind it was to keep setup as easy as possible and to treat files as
much like other attributes as possible. This means they aren't saved to their
final locations on disk, nor are they deleted if set to nil, until
ActiveRecord::Base#save is called. It manages validations based on size and
presence, if required. It can transform its assigned image into thumbnails if
needed, and the prerequisites are as simple as installing ImageMagick (which,
for most modern Unix-based systems, is as easy as installing the right
packages). Attached files are saved to the filesystem and referenced in the
browser by an easily understandable specification, which has sensible and
useful defaults.

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

### Configuration

The GEM comes with a generator that creates an initializer file for 

```ruby
rails generate roguelytics
```

### View Helper

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

### Models

Roguelytics 
For each model that you want Roguelytics to monitor, add the following two lines:

```ruby
class Article < ActiveRecord::Base
	include Roguelytics::HasRoguelytics
	has_roguelytics
end
```

Roguelytics create an ActiveJob for each of the following actions: CREATE, UPDATE, DELETE.

The GEM will pass the object's class name and ID to Roguelytics. IF the model responds to "name", the name of the model will also be passed and can be used for reporting.

Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! Send us an email: developers@roguestudios.io


License
-------

Paperclip is Copyright © 2017 Rogue Studios, LLC. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.

About Rogue Studios
-------------------

[RogueStudios]: https://thoughtbot.com?utm_source=github

Roguelytics GEM is maintained and funded by Rogue Studios.
The names and logos for thoughtbot are trademarks of Rogue Studios, LLC.

[RogueStudios]: https://thoughtbot.com?utm_source=github