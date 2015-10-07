class ProjectsController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.type=="User"
			if current_user.user_detail
				@projects=Project.where(status: "Pending").order(created_at: :desc)
			else
				redirect_to new_user_detail_path , notice: "Please add your extra details"
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
		@project = Project.find_by_id(params[:id])
		if current_user.type == "Client"
			if @project.status == 'Pending'
				@applicants = @project.applied_projects
			else
				@applicant = @project.user
			end
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

	def apply
		apply=AppliedProject.where('project_id = ?' , params[:id])
		@new_apply=apply.where('user_id= ?', current_user.id).limit(1)
		if @new_apply.blank?
			@new_apply=AppliedProject.new
			@new_apply.user_id=current_user.id
			@new_apply.project_id=params[:id]
			if @new_apply.save
				redirect_to projects_path , notice: 'You have applied successfully'
			else
				render 'index' , notice: 'Error Occured!'
			end
		else
			redirect_to projects_path , notice: 'You have already applied for this'
		end
	end	

	def myProjects
		@assignedProjects=current_user.projects
		@appliedProjects=current_user.applied_projects
	end

	def viewApplicants
		@project=Project.find_by_id(params[:id])
		@applicants=AppliedProject.where('project_id = ?' , params[:id]).includes(:user)
	end

	def assignProject
		@project=Project.find_by_id(params[:id])
		@project.user = User.find_by_id(params[:user_id]) 
		if @project.save
			redirect_to projects_path , notice: "project has been assigned to user successfully"
		else
			render 'viewApplicants'
		end
	end

	def start
		@project=Project.find_by_id(params[:id])
		@project.status = "Running"
		if @project.save
			redirect_to myProjects_projects_path , notice: "project has started..."
		else
			render 'myProjects' , notice: 'Error Ocurred...'
		end
	end

	def complete
		@project=Project.find_by_id(params[:id])
		@project.status = "Completed"
		if @project.save
			redirect_to myProjects_projects_path , notice: "project has completed..."
		else
			render 'myProjects' , notice: 'Error Ocurred...'
		end
	end

	private	
		def project_params
			params.require(:project).permit(:name, :skills , :details, :time_period)
		end

end
