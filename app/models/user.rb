class User < ActiveRecord::Base
    has_secure_password

    has_many :characters
    has_many :spells
    accepts_nested_attributes_for :characters, :spells

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, presence: true

end