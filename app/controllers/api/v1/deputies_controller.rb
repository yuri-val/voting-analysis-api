module Api::V1
	class DeputiesController < ApiController

		# GET /v1/deputies
		def index
			render json: Deputy.all
		end

	end
end