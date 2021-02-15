class DeductionList < ApplicationRecord
  validates :income_id, presence: true
  validates :fimily_id, presence: true
  validates :deduction, presence: true
end
