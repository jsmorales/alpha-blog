class Category < ActiveRecord::Base

	#
	has_many :article_categories
	has_many :articles, through: :article_categories

	#validaciones
	validates :name, presence: true, uniqueness: true, length: {minimum: 5, maximum: 30}
	#asegura que el nombre se unico para este campo
	#validates_uniqueness_of :name
end