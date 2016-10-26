class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #funciones que me indican si el usuario esta logueado
  #y demás.

  #estas funciones están disponibles en toda la aplicación
  #referenciadolas como helper_methods asi:

  helper_method :current_user, :logged_in?

  def current_user
  	#retorna el usuario basado en el id del arreglo session
  	#creado en el metodo create del controlador sessions_controller
  	#pero solo en caso de que la variable esté vacía
  	#debugger
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	#revisa si current_user devuelve true o false
  	#!! convierte cualquier valor en un booleano
  	!!current_user
  end

  def require_user
  	#este metodo nos sirve para restringir funciones de la aplicación
  	#

  	if !logged_in?
  		#si no esta logueado, da un mensaje de error y redirige a iniciar sesion
  		flash[:danger] = "Debe iniciar sesión, no tiene acceso a esta funcionalidad."
  		redirect_to login_path  	
  	end

  end

end
