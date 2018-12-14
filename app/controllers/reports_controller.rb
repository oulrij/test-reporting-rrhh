class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.all.order('checked_in DESC')
  end

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.save

    redirect_to report_path(@report)
  end

  def update
    @report.update(report_params)

    redirect_to report_path(@report)
  end

  def destroy
    @report.destroy

    redirect_to reports_path
  end

  private

  def set_report
    @report = report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:first_name, :lasst_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_employee, :is_manager, :manager_id, :email)
  end
end
