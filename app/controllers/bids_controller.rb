class BidsController < ApplicationController
	def new
		@bid = Bid.new
	end

	def create
		@bid = Bid.new(bid_params)
		@bid.project=Project.find(params[:project_id])
		@bid.user=current_user
		if @bid.save
			redirect_to project_path(params[:project_id]), notice: "you made a Bid successfully"
		else
			redirect_to project_path(params[:project_id]), notice: "Some error occured"
		end
	end

	private
		def bid_params
			params.require(:bid).permit(:amount , :message)
		end
end
