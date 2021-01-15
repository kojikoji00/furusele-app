class Category < ApplicationRecord
  has_many :selects, dependent: :destory
end
