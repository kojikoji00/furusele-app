class DeductionList < ApplicationRecord
  validates :id, presence: true
  validates :income_id, presence: true
  validates :family_id, presence: true
  validates :deduction, presence: true
  validates :deduction_id, presence: true
end
