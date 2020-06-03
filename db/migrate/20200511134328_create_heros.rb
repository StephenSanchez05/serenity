class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :spell, foreign_key: true

      t.timestamps
    end
  end
end
