class User < ActiveRecord::Base
    has_secure_password

    has_many :characters
    has_many :spells

    validates :name, presence: true
    validates :password, presence: true
end