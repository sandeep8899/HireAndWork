class ProjectsController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.type=="User"
			if current_user.user_detail
				@projects=Project.where(status: "Pending").order(created_at: :desc)
			else
				redirect_to new_user_details_path , notice: "Please add your extra details"
			end
		else
			@projects=current_user.projects
		end
	end

	def new 
		@project=Project.new
	end

	def create
		@project=Project.new(project_params)
		@project.client_id=current_user.id
		if @project.save
			redirect_to projects_path , notice: "Project has been added successfully"
		else
			render 'new'
		end
	end

	def show
		@project=Project.find_by_id(params[:id])
		@project_bids = @project.bids
		if current_user.type == "User"
			@bid=Bid.new
		end
	end

	def edit
		@project=Project.find_by_id(params[:id])
	end

	def update
		@project=Project.find_by_id(params[:id])
		if @project.update_attributes(project_params)
			redirect_to projects_path , notice: "project details updated successfully"
		else
			render 'edit'
		end
	end

	def destroy
		@project=Project.find_by_id(params[:id])
		@project.destroy
		redirect_to projects_path , notice: "your Project deleted successfully"
	end

	private	
		def project_params
			params.require(:project).permit(:name, :skills , :details, :time_period)
		end

end
