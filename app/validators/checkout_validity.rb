class CheckoutValidity < ActiveModel::Validator
  def validate(record)
    msg1 = "Check out cannot happen before check in"
    msg2 = "Check out date and time cannot be in the future"
    record.errors[:base] << msg2 if record.checked_in && record.checked_out && record.checked_out > DateTime.now
    record.errors[:base] << msg1 if record.checked_in && record.checked_out && record.checked_out < record.checked_in
  end
end
