class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :class
      t.integer :level
      t.string :backstory  
      t.belongs_to :user, null: false, foreign_key: true    

      t.timestamps
    end
  end
end
