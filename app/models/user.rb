class User < ApplicationRecord
    has_many :reservations
    has_many :homes, through: :reservations
end
