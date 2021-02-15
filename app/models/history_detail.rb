class HistoryDetail < ApplicationRecord
  belongs_to :history
  validates :id, presence: true, uniqueness: true
  validates :history_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :link, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :picture_image_path, presence: true
  validates :review_image_path, presence: true
end

