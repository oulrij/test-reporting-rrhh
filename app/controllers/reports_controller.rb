class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.all.order('checked_in DESC')
  end

  def show
  end

  def new
    @user = User.find(params[:id])
    @report = @Reports.new
  end

  def create
    @user = User.find(params[:id])
    @report = @user.reports.new(reports_params)
    if @report.save
      redirect_to user_user_path, notice: 'Report for employee "#{@user.first_name} #{@user.last_name}" was successfully created!'
    else
      render :new
    end

    redirect_to report_path(@report)
  end

  def edit
  end

  def update
    @report.update(report_params)
    redirect_to user_user_path(@report.user)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:checked_in, :cheked_out)
  end
end
