class HistoryDetail < ApplicationRecord
  belongs_to :history
  validates :id, uniqueness: true
end

