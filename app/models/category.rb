class Category < ActiveRecord::Base

	#validaciones
	validates :name, presence: true, uniqueness: true, length: {minimum: 5, maximum: 30}
	#asegura que el nombre se unico para este campo
	#validates_uniqueness_of :name
end