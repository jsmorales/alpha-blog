class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	#registra fecha hora, no aparece como campo
    	t.timestamps
    end
  end
end
