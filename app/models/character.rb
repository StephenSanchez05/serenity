class Character < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :user
    has_many :heros, :dependent => :delete_all
    has_many :spells, through: :heros

    scope :low_level, -> { where("level < 10")}
    scope :high_level, -> { where("level >= 10")}

    validates :name, presence: true
    validates :warrior, presence: true
    validates :level, presence: true, numericality: { only_integer: true }

    validate :is_class?

    DND = [ /artificer/, /barbarian/, /bard/, /cleric/, /druid/, /fighter/, /monk/, /paladin/, /ranger/, /rogue/, /sorcerer/, /warlock/, /wizard/ ]


    def is_class?
        if DND.none? { |c| c.match warrior.downcase }
            errors.add(:warrior, "We do not recgonize that as a DnD class")
            end
        end
end
