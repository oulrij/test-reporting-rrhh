class Api::V1::ReportsController < Api::V1::BaseController
  before_action :set_report, only: %i[show]

  def show
  end

  private

  def set_report
    @report = Report.find(params[:id])
    authorize @report
  end
end
