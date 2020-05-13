class User < ActiveRecord::Base
    has_many :characters
    has_many :spells
end