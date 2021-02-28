class HistoryDetail < ApplicationRecord
  belongs_to :history
  validates :id, uniqueness: true
  validates :link, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :picture_image_path, presence: true
  validates :review_image_path, presence: true
end

