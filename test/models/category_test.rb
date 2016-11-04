require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	#cada vez que se haga el test este metodo
	#es el que lo va a ejecutar
	def setup
		#variable global category
		@category = Category.new(name: "Techologia")
	end

	#primer test

	test "La categoria deberia ser valida" do 

		#assertions
		assert @category.valid?
	end

	test "El nombre es obligatorio" do

		@category.name = " "

		#assert_not @category.valid?
		#validacion a travez del modelo
		#el nombre de esta categoria, no es valido?
		#cierto, no es valido
		assert !@category.name?

	end

	test "No pueden haber 2 categorías con el mismo nombre" do
		@category.save
		category2 = Category.new(name: " ")
		#la categoria 2 no es valida?
		#cierto, la categoria 2 no es valida ya que guardo el nombre vacio
		#igual que la primera categoria
		assert_not category2.valid?
	end

	test "El nombre no debe ser mas de 30 caracteres" do
		@category.name = "a"*40
		assert_not @category.valid?
	end

	test "El nombre no debe ser menor de 5 caracteres" do
		@category.name = "aa"
		assert_not @category.valid?
	end

end
