require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


	def setup
		@category = Category.create(name: "Tecnología")
	end

	test 'deberia tener un index' do 
		get :index
		assert_response :success
	end


	test 'deberia tener un new' do 
		get :new
		assert_response :success
	end

	test 'deberia tener un show' do 
		get(:show, {'id' => @category.id})
		assert_response :success
	end

end
