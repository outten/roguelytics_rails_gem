module Roguelytics
	module ViewHelpers
		def roguelytics
			raw "<div id='roguelytics'></div><script src='https://www.roguelytics.com/js/v1/roguelytics.js?sitekey=#{ROGUELYTICS_SITEKEY}'></script>"
		end
	end
end