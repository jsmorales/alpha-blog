require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	#test en caso de que se pueda crear perfectamente una
	#categoría

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

	#test en caso de excepción, error

	test 'categoria invalida resultados en error' do

		#va al formulario
		get new_category_path
		#revisa que este la pagina
		assert_template 'categories/new'

		#se envia una peticion post a categories_path
		#y que no halla diferencia en el count
		assert_no_difference 'Category.count' do
			#le envia un nombre vacío
			post categories_path, category: {name: " "}
		end

		#redirecciona a new segun el controlador
		assert_template 'categories/new'
		#selecciona los mensajes de error producidos por
		#la excepcion, selecciona el DOM, estos elementos son
		#los que se crean en el parcial shared/_errors.html.erb 
		assert_select 'h3.panel-title'
		assert_select 'div.panel-body'

	end

end
