
require "active_job"

module Roguelytics
	class ProcessJob < ActiveJob::Base
		queue_as :default

		def perform(event,params)

			params[:sitekey] = ROGUELYTICS_SITEKEY

			url_base = "https://www.roguelytics.com"

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

			#begin
				uri 		= URI url
				uri.query 	= URI.encode_www_form(params)
				res 		= Net::HTTP.get_response(uri)
				puts res.body if res.is_a?(Net::HTTPSuccess)
			#rescue
			#end

			true
		end
	end
end