class CharacterValidator < ActiveModel::Validator
    def validate(record)
        dnd = ["artificer", "barbarian", "bard", "cleric", "druid", "fighter", "monk", "paladin", "ranger", "rogue", "sorcerer", "warlock", "wizard"]
        unless dnd.include?(record.warrior.downcase)
            record.errors[:warrior] << "We do not recgonize that as a DnD class"
            end
        end
    end