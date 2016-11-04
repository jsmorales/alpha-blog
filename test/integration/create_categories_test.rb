require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test 'get formulario y crear categoria' do
		#va al formulario
		get new_category_path
		#revisa que este la pagina
		assert_template 'categories/new'

		#se envia una peticion post a categories_path
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "tecnologia"}
		end

		#redirecciona a index
		assert_template 'categories/index'
		#en esta pagina debe aparecer el nombre de la 
		#categoria que se envio
		assert_match "tecnologia", response.body

	end

end
