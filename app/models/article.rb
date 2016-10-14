class Article < ActiveRecord::Base

	#validacion de atributos

	#valida que el titulo no esté vacío y que no sea menor de 5 ni mayor a 30.
	validates :tittle, presence: true, length: {minimum: 5, maximum: 30}
	#valida que la descripcion no esté vacía y que no sea menor de 10 ni mayor a 300.
	validates :description, presence: true, length: {minimum: 10, maximum: 300}

end