class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
						
		if @user.save
			#da el mensaje que se guardo bien
			flash[:success] = "El usuario #{@user.username} se registró correctamente!"
			redirect_to articles_path
		else
			render 'new'
		end

	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end