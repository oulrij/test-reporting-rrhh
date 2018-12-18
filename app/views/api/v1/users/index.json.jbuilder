json.array! @users do |user|
  json.extract! user, :id, :first_name, :last_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_manager, :manager_id, :email
end
