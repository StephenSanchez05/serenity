class CreateUsers < ActiveRecord::Migration[6.0]
    def change
      create_table :users do |t|
        t.string :name
        t.string :email
        t.string :uid
        t.string :image
  
        t.timestamps null: false
      end
    end
  end