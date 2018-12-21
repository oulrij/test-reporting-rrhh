class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update]

  def index
    @reports = policy_scope(Report).all.order('checked_in DESC')
  end

  def show
  end

  def new
    @report = Report.new
    @user = User.find(params[:format])
    authorize @report
  end

  def create
    authorize @report
    @user = User.find(params[:format])
    @report = Report.new(reports_params)
    @report.user = @user
    if @report.save
      redirect_to user_user_path, notice: 'Report for employee "#{@user.first_name} #{@user.last_name}" was successfully created!'
    else
      render :new
    end
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
    authorize @report
  end

  def report_params
    params.require(:report).permit(:checked_in, :cheked_out)
  end
end
