class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :spell_id
      t.integer :character_id

      t.timestamps
    end
  end
end
