class Character < ApplicationRecord
    belongs_to :user
    has_many :heroes
    has_many :spells, through: :heroes
end
