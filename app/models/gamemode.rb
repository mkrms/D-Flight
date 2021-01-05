class Gamemode < ApplicationRecord
    has_many :countups
    has_many :zeroones
end
