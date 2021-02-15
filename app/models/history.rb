class History < ApplicationRecord
  belongs_to :user
  has_many :history_detail
  validates :id, presence: true, uniqueness: true
end