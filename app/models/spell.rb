class Spell < ApplicationRecord
  belongs_to :user
  has_many :heros, :dependent => :delete_all
  has_many :characters, through: :heros
  accepts_nested_attributes_for :heros, :characters

  validates :name, presence: true
end
