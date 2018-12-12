require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "Reports check-in time cannot be in the future" do
    report = Report.new(checked_in: "31-12-2018 08:05:06 AM")
    assert report.checked_in < Time.now
  end
end
