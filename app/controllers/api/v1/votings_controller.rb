module Api::V1
  class VotingsController < ApiController
    before_action :set_voting, only: [:show]

    # GET /api/v1/votings
    def index
      
      deputy_id = params[:id]

      @votings = Voting.all
      @votings = @votings.by_deputy(deputy_id) unless deputy_id.nil?
        
      render json: @votings
    end

    # GET /api/v1/votings/1
    def show
      render json: @voting
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_voting
        @voting = Voting.find(params[:id])
      end
  end
end
