class Zeroone < ApplicationRecord
  belongs_to :gamemode
  has_many :rounds
  belongs_to :user
end
