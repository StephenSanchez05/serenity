class Hero < ApplicationRecord
  belongs_to :character, required: false
  belongs_to :spell, required: false
  accepts_nested_attributes_for :character, :spell
end
