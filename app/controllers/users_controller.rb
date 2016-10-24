class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

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

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "Se actualizó correctamente la cuenta de #{@user.username}!"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end