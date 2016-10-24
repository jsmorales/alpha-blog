class ArticlesController < ApplicationController

	#este callback define que antes de cualquier cosa
	#se va a ejecutar el metodo dicho en esta linea
	#y solo se quiere esto en show,edit,update,destroy
	#para esto se utiliza only y el arreglo de funciones

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		#@articles = Article.all
		@articles = Article.paginate(page: params[:page], per_page: 5)		
	end	

	def new
		@article = Article.new
	end

	def show
		#@article = Article.find(params[:id])
	end

	def edit
		#@article = Article.find(params[:id])
	end

	#crea despues de new
	def create
		#para mostrar lo que se esta enviando se hace con
		#render plain: params[:article].inspect
		
		#para hacer debug basta con escribir:
		#debugger 
		#en la linea necesaria
		#para pasar a la siguiente linea se escribe n 
		#y para terminar se ejecuta ctr+d

		@article = Article.new(article_params)
		#se añade un usuario a las malas
		@article.user = User.first

		#@article.save
		#redirecciona a la pagina del articulo cuando lo 
		#halla creado.
		#consultando "rake routes" sabemos cual es la ruta
		#y se le pasa el articulo que se cargo en la 
		#variable global.
		
		if @article.save
			#da el mensaje que se guardo bien
			flash[:success] = "Se guardó correctamente!"
			redirect_to article_path(@article)
		else
			render 'new'
		end

	end

	#actualiza despues de edit
	def update

		#@article = Article.find(params[:id])
		#añadiendo el usuario a la maldita sea
		@article.user = User.first

		if @article.update(article_params)
			flash[:success] = "Se actualizó correctamente!"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
		
	end


	def destroy
		#@article = Article.find(params[:id])
		@article.destroy
		flash[:danger] = "El artículo '"+@article.tittle+"' ha sido eliminado."
		redirect_to articles_path		
	end

	private

		def set_article
			#se define este metodo para no estar repitiendo
			#esta línea en todos los metodos que la necesitan
			@article = Article.find(params[:id])
		end

		def article_params
			#aca se define que los unicos parametros permitidos son
			#el titulo y la descripcion
			params.require(:article).permit(:tittle, :description)
		end

end