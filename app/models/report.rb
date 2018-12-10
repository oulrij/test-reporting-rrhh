class Report < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user

  validates :checked_in, presence: true
  validates :checked_out, presence: true, on: :update, if: :checked_in?

  def checked_in?
    checked_in
  end

  validates_with CheckinValidity
  validates_with CheckoutValidity
end
