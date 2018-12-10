class Report < ApplicationRecord
  belongs_to :user

  validates :checked_in, presence: true
  validates :checked_out, presence: true, unless: Proc.new { |report| report.checked_in.blank? }

  validates_with TimecheckValidity
  validates_with CheckoutValidity
end
