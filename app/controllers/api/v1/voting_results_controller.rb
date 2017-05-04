module Api::V1
	class VotingResultsController < ApiController
		before_action :set_voting_result, only: [:show, :update, :destroy]

		# GET /voting_results
		def index
			@voting_results = VotingResult.all

			render json: @voting_results
		end

		# GET /voting_results/1
		def show
			render json: @voting_result
		end

		private
		# Use callbacks to share common setup or constraints between actions.
		def set_voting_result
			@voting_result = VotingResult.find(params[:id])
		end

	end
end
