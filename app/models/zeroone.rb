class Zeroone < ApplicationRecord
  belongs_to :gamemode
  has_many :z_rounds
  belongs_to :user
end
