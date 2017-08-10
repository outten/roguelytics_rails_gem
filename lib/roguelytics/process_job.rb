
require "active_job"

module Roguelytics
	class ProcessJob < ActiveJob::Base
		queue_as :default

		def perform(event,params)

			params[:sitekey] = ROGUELYTICS_SITEKEY

			url_base = "http://localhost:3000"
			url_base = "https://roguelytics-staging.roguestartup.com" if Rails.env.production?
			url_base = "https://roguelytics-staging.roguestartup.com" if Rails.env.staging?

			if event == 'create'
				url = "#{url_base}/api/v1/site_event/create.json"
			elsif event == 'update'
				url = "#{url_base}/api/v1/site_event/update.json"
			elsif event == 'delete'
				url = "#{url_base}/api/v1/site_event/delete.json"
			else
				raise "unknown event:#{event}"
				return
			end

			uri 		= URI url
			uri.query 	= URI.encode_www_form(params)
			res 		= Net::HTTP.get_response(uri)
			puts res.body if res.is_a?(Net::HTTPSuccess)

			true
		end
	end
end