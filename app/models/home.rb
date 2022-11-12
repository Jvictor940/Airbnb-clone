class Home < ApplicationRecord
    has_many :reservations 
    has_many :users, through: :reservations

    has_many :images
end
