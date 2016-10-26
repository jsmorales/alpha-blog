class SessionsController < ApplicationController

	#renderiza un formulario
	def new
		#@session = 
	end

	#crea la session
	def create
		#debugger
		#se busca al usuario segun el email
		#se busca dentro de :session porque es el objeto que se crea
		#dentro del formulario
		user = User.find_by(email: params[:session][:email].downcase)

		#se pasa a crear la sesion solo si existe el usuario con ese
		#correo y si la contraseña es correcta utilizando el metodo authenticate
		#debugger
		if user && user.authenticate(params[:session][:password])

			flash[:success] = "Se ha autenticado correctamente."
			#dentro de la cookie session se crea un hash user_id
			session[:user_id] = user.id

			#va a la pagina de detalle del usuario
			#debugger
			redirect_to user_path(user)

		else

			#algo salio mal
			flash.now[:danger] = "Usuario o Contraseña incorrectos."
			render 'new'
		end

	end

	#cierra la sesion del usuario
	def destroy
		session[:user_id] = nil
		flash[:success] = "Se ha cerrado su sesión correctamente."
		redirect_to root_path
	end

end