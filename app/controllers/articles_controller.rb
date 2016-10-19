class ArticlesController < ApplicationController

	def index
		@articles = Article.all		
	end	

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	#crea despues de new
	def create
		#para mostrar lo que se esta enviando se hace con
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		#@article.save
		#redirecciona a la pagina del articulo cuando lo 
		#halla creado.
		#consultando "rake routes" sabemos cual es la ruta
		#y se le pasa el articulo que se cargo en la 
		#variable global.
		
		if @article.save
			#da el mensaje que se guardo bien
			flash[:notice] = "Se guardó correctamente!"
			redirect_to article_path(@article)
		else
			render 'new'
		end

	end

	#actualiza despues de edit
	def update

		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = "Se actualizó correctamente!"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
		
	end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "El artículo '"+@article.tittle+"' ha sido eliminado."
		redirect_to articles_path		
	end

	private

		def article_params
			#aca se define que los unicos parametros permitidos son
			#el titulo y la descripcion
			params.require(:article).permit(:tittle, :description)
		end

end