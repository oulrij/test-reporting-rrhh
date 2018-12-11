class My::ReportsController < ApplicationController
  def index
    @reports = current_user.reports
  end
end
