class Character < ApplicationRecord
    belongs_to :user
    has_many :heros, :dependent => :delete_all
    has_many :spells, through: :heros

    scope :low_level, -> { where("level < 10")}
    scope :high_level, -> { where("level >= 10")}

    validates :name, presence: true
    validates :warrior, presence: true
end
