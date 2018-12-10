class CheckinValidity < ActiveModel::Validator
  def validate(record)
    chk_in = record.checked_in
    msg = "Check in date and time cannot be in the future"
    record.errors[:base] << msg if chk_in && chk_in > DateTime.now
  end
end
