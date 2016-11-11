require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


	def setup
		@category = Category.create(name: "Tecnología")
		@user = User.create(username: "jhon", email: "jhondoe@gmail.com", password: "12345", admin: true)
	end

	test 'deberia tener un index' do 
		get :index
		assert_response :success
	end


	test 'deberia tener un new' do
		#simula el inicio de sesion con el usuario creado en el setup
		session[:user_id] = @user.id 
		get :new
		assert_response :success
	end

	test 'deberia tener un show' do 
		get(:show, {'id' => @category.id})
		assert_response :success
	end

	test 'redirecciona a crear cuando el admin no esta logueado' do
		#si no hay diferencia en count de Category
		assert_no_difference 'Category.count' do
			post :create, category: { name: "Tecnología"}
		end

		assert_redirected_to categories_path
	end

end
