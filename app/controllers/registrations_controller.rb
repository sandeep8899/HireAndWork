class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create 
		# byebug
		# if params[:type]=='1'
		# 	@obj=Client.new(sign_up_params)
		
		# else
		# 	@obj=User.new(sign_up_params)
			
		# end
		# if @obj.save
		# 	redirect_to jobs_path
		# else
		# 	render('devise/registrations/new')
		# end
		super
	end

	
public

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation , :type)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
