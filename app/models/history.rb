class History < ApplicationRecord
  belongs_to :user
  has_many :histroy_detail
end
