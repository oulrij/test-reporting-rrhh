json.array! @reports do |report|
  json.extract! report, :id, :checked_in, :checked_out
end
