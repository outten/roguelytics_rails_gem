require 'roguelytics/view_helpers'
module Roguelytics
	class Railtie < Rails::Railtie
		initializer "roguelytics.view_helpers" do
			ActionView::Base.send :include, ViewHelpers
		end
	end
end