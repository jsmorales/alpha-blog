class ArticlesController < ApplicationController	

	def new
		@article = Article.new
	end

	def create
		#para mostrar lo que se esta enviando se hace con
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.save
		#redirecciona a la pagina del articulo cuando lo 
		#halla creado.
		redirect_to articles_show(@article)
	end

	private
		def article_params
			#aca se define que los unicos parametros permitidos son
			#el titulo y la descripcion
			params.require(:article).permit(:tittle, :description)
		end
end