json.extract! @report, :id, :checked_in, :checked_out
json.user @report.user do |user|
  json.extract! user, :id, :rfc
end
