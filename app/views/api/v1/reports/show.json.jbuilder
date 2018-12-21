json.extract! @report, :id, :checked_in, :checked_out

json.extract! @report.user, :first_name, :last_name, :rfc

