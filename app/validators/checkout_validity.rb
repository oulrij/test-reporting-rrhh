class CheckoutValidity < ActiveRecord::Validator
  def validate(record)
    msg = "Check out cannot happen before check in"
    record.errors[:base] << msg if record.checked_out > record.checked_in
  end
end
