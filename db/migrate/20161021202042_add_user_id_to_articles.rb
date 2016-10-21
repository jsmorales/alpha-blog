class AddUserIdToArticles < ActiveRecord::Migration
  def change
  	#añadir columna a articulo llamada user_id
  	#la cual sera de tipo integer
  	add_column :articles, :user_id, :integer
  end
end
