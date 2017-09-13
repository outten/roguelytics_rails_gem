class RoguelyticsGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers for Roguelytics"
  def create_initializer_file
    create_file "config/initializers/roguelytics.rb", "
#
# Roguelytics Initializer
#
ROGUELYTICS_SITEKEY = '' if Rails.env.production?
ROGUELYTICS_SITEKEY = '' if Rails.env.staging?
ROGUELYTICS_SITEKEY = '' if Rails.env.development?
ROGUELYTICS_SITEKEY = '' if Rails.env.qa?
ROGUELYTICS_SITEKEY = '' if Rails.env.test?
"


  end
end
