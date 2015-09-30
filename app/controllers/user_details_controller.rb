class UserDetailsController < ApplicationController

	before_action :authenticate_user!

	def index

	end

	def new
		@user_detail=UserDetail.new
	end

	def create
		@user_detail=UserDetail.new(user_detail_params)
		@user_detail.user=current_user
		if @user_detail.save
			redirect_to projects_path , notice: "your details has been added successfully"
		else
			render 'new'
		end
	end

	def show
		@user_detail=UserDetail.find_by_id(params[:id])
	end

	def edit
		@user_detail=UserDetail.find_by_id(params[:id])
	end

	def update
		@user_detail=UserDetail.find_by_id(params[:id])
		if @user_detail.update_attributes(user_detail_params)
			redirect_to user_detail_path(@user_detail) , notice: "Details has been updated successfully"
		else
			render 'edit'
		end
	end

	private
		def user_detail_params
			params.require(:user_detail).permit(:name , :qualification , :skills , :experience , :contact_number , :specialist_in)
		end
end
