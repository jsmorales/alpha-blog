class CategoriesController < ApplicationController

	before_action :require_admin, except: [:index, :show]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def new
		@category = Category.new()
	end

	def create
		@category = Category.new(category_params)

		if @category.save

			flash[:success] = "Se creó la categoría correctamente."
			redirect_to categories_path
			
		else
			render 'new'
		end
	end

	def show
		@category = Category.find(params[:id])
		@category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		
		@category = Category.find(params[:id])

		if @category.update(category_params)
			flash[:success] = "Se actualizó correctamente!"
			redirect_to category_path(@category)
		else
			render 'edit'
		end

	end

	def destroy
		
		@category = Category.find(params[:id])

		@category.destroy
		flash[:danger] = "La categoría '"+@category.name+"' ha sido eliminada."
		redirect_to categories_path		
	end

	private

	def category_params

		params.require(:category).permit(:name)
		
	end

	def require_admin

		#si no esta logueado O si esta logueado y no es admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] = "Esta acción es solo para usuarios administradores."
			redirect_to categories_path
		end

	end

end