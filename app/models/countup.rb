class Countup < ApplicationRecord
    has_many :gamemode
    has_many :rounds
    belongs_to :user
end
