require "yaml"

puts 'Cleaning database...'
User.destroy_all

users_file = File.join(__dir__, "../test/fixtures/files/users.yml")
reports_file = File.join(__dir__, "../test/fixtures/files/reports.yml")

users_sample = YAML.load(open(users_file).read)
reports_sample = YAML.load(open(reports_file).read)

puts 'Creating managers...'
managers = {}  # slug => Manager
users_sample["managers"].each do |manager|
  managers[manager["slug"]] = User.create! manager.slice("first_name", "last_name", "phone_number", "hire_date", "job", "salary", "is_manager", "is_employee", "rfc", "email", "password")
end

puts 'Creating subordinates...'
users = {} # slug => Subordinate
users_sample["subordinates"].each do |subordinate|
  users[subordinate["slug"]] = User.create! subordinate.slice("first_name", "last_name", "phone_number", "hire_date", "job", "salary", "is_manager", "is_employee", "rfc", "email", "password").merge(manager: managers[subordinate["manager_slug"]])
end

puts 'Creating reports...'
reports_sample["reports"].each do |report|
  Report.create! report.slice("checked_in", "checked_out").merge(user: users[report["slug"]])
end
puts 'Finished!'
