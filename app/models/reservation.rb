class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :home 
    has_many :reviews
end
