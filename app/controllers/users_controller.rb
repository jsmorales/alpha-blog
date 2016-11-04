class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_same_user, only: [:edit, :update]
	before_action :require_admin, only: [:destroy]

	def index
		#@users = User.all
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def show
		#@user = User.find(params[:id])
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
						
		if @user.save
			#crea la cookie de session id
			session[:user_id] = @user.id
			#da el mensaje que se guardo bien
			flash[:success] = "El usuario #{@user.username} se registró correctamente!"
			redirect_to user_path(@user)
		else
			render 'new'
		end

	end

	def edit
		#@user = User.find(params[:id])
	end

	def update
		#@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "Se actualizó correctamente la cuenta de #{@user.username}!"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def destroy
		
		#cierra la session si es el usuario mismo
		if current_user == @user
			session[:user_id] = nil
		end

		@user.destroy
		
		#mensaje de eliminación
		flash[:danger] = "La cuenta y los artículos de '"+@user.username+"' han sido eliminados."
		redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user

		if current_user != @user
			flash[:danger] = "Solo puede editar o eliminar su propio perfil."
			redirect_to users_path
		end

	end

	def require_admin

		if !current_user.admin?
			flash[:danger] = "No tiene permisos de Administrador para ejecutar esta acción."
			redirect_to users_path
		end

	end

end