class TimecheckValidity < ActiveModel::Validator
  def validate(record)
    chk_in = record.checked_in
    chk_out = record.checked_out
    msg = "Check in / Check out date and time cannot be in the future"
    record.errors[:base] << msg if chk_in > DateTime.now || chk_out > DateTime.now
  end
end
