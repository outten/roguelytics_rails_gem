require 'rails/generators'

module Roguelytics
	class InitializerGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		namespace "roguelytics"
		desc "This generator creates an initializer file at config/initializers for Roguelytics"

		def create_initializer_file
			create_file "config/initializers/roguelytics.rb", "
#
# Roguelytics Initializer
#

require 'roguelytics'

ROGUELYTICS_SITEKEY = '' if Rails.env.production?
ROGUELYTICS_SITEKEY = '' if Rails.env.staging?
ROGUELYTICS_SITEKEY = '' if Rails.env.development?
ROGUELYTICS_SITEKEY = '' if Rails.env.qa?
ROGUELYTICS_SITEKEY = '' if Rails.env.test?
"
		end
	end
end	
