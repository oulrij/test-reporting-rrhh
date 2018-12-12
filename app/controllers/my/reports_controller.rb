class My::ReportsController < ApplicationController
  def index
    @reports = current_user.reports.order('checked_in DESC')
  end
end
