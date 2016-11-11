require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "tecnologia")
		@category2 = Category.create(name: "ciencia")
	end

	test "debería mostrar la lista de categorias" do
		get categories_path
		assert_template 'categories/index'

		#seleccionar el link de cada uno de la siguiente forma:
		assert_select "a[href=?]", category_path(@category), text: @category.name	
		assert_select "a[href=?]", category_path(@category2), text: @category2.name	
	end

end
