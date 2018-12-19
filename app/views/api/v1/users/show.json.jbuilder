json.extract! @user, :id, :first_name, :last_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_manager, :manager_id, :email, :authentication_token
json.reports @user.reports do |report|
  json.extract! report, :id, :checked_in, :checked_out
end
