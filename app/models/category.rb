class Category < ApplicationRecord
  has_many :category_details, dependent: :destroy
  validates :id, presence: true, uniqueness: true
end
