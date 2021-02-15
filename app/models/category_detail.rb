class CategoryDetail < ApplicationRecord
  belongs_to :category
  validates :id, presence: true, uniqueness: true
end
