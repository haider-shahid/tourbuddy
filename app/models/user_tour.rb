class UserTour < ApplicationRecord
  belongs_to :user
  has_many :user_comments ,dependent: :destroy
  validates :user_id, presence: true
  validates :duration, presence: true
  validates :destination, presence: true
  validates :title, presence: true
  validates :budget, presence: true
  validates :full_plan, presence: true
  validates :departure_date, presence: true
end