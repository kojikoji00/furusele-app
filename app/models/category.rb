class Category < ApplicationRecord
  has_many :selects, dependent: :destroy
end
