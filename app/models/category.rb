class Category < ApplicationRecord
  has_many :selects, dependent: :destroy
  has_many :category_details, dependent: :destroy
end
