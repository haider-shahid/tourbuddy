class Tour < ApplicationRecord
  has_one_attached :image
  belongs_to :agency
  has_many :favourite
  # has_many :users, :through

  validates :agency_id, presence: true
  validates :duration, presence: true
  validates :destination, presence: true
  validates :title, presence: true
  validates :budget, presence: true
  validates :full_plan, presence: true
  validates :departure_date, presence: true

  has_many :inclusions ,dependent: :destroy
  accepts_nested_attributes_for :inclusions,allow_destroy: true,reject_if: :all_blank
  has_many :comments ,dependent: :destroy
end