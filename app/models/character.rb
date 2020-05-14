class Character < ApplicationRecord
    belongs_to :user
    has_many :heros
    has_many :spells, through: :heros
end
