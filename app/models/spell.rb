class Spell < ApplicationRecord
  belongs_to :user
  has_many :heros
  has_many :characters, through: heros
end
