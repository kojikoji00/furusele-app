class DeductionList < ApplicationRecord
  validates :income_id, presence: true
  validates :family_id, presence: true
  validates :deduction, presence: true
end
