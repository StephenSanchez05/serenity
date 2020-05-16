class Spell < ApplicationRecord
  belongs_to :user
  has_many :heros, :dependent => :delete_all
  has_many :characters, through: :heros
end
