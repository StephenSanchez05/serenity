class Spell < ApplicationRecord
  belongs_to :user
  has_many :heroes
  has_many :characters, through: :heroes
end
