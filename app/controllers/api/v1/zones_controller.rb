module Api::V1
	class ZonesController < ApiController
		def index
			deputy_id = params[:deputy_id]

			response = {}
			response = ZoneCalculator.new(Deputy.find(deputy_id)).values unless deputy_id.nil?

			render json: response
		end
	end
end
