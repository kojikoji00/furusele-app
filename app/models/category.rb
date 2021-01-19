class Category < ApplicationRecord
  has_many :selects, dependent: :destroy
  has_ancestry
end
