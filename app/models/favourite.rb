class Favourite < ApplicationRecord
  belongs_to :tour
  belongs_to :user
end
