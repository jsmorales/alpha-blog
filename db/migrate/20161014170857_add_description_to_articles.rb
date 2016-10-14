class AddDescriptionToArticles < ActiveRecord::Migration
  def change
  	#Para añadir una columna a una tabla se usa el metodo
  	#add_column :nombretabla, :nombrecolumna, :tipocolumna
  	add_column :articles, :description, :text
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :updated_at, :datetime
  end
end
