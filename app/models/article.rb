class Article < ActiveRecord::Base
	#indica que pertenece a user
	belongs_to :user

	#validacion de atributos

	#valida que el titulo no esté vacío y que no sea menor de 5 ni mayor a 30.
	validates :tittle, presence: true, length: {minimum: 5, maximum: 30}
	#valida que la descripcion no esté vacía y que no sea menor de 10 ni mayor a 300.
	validates :description, presence: true, length: {minimum: 10, maximum: 300}

	#validacion para que el campo de user_id no quede vacio
	validates :user_id, presence: true

end