class ArticleCategory < ActiveRecord::Base
	#esta tabla pertenece a article y a category
	belongs_to :article
	belongs_to :category
end