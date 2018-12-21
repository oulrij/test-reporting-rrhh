class Api::V1::ReportsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :set_report, only: %i[show update]

  def index
    @reports = policy_scope(Report).all.order('checked_in DESC')
  end

  def show
  end

  def create
    authorize @report
    @user = User.find(params[:format])
    @report = Report.new(reports_params)
    @report.user = @user
    if @report.save
      render :new
    else
      render_error
    end
  end

  def update
    if @report.update(report_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
    authorize @report
  end

  def report_params
    params.require(:report).permit(:checked_in, :checked_out)
  end

  def render_error
    render  json: { errors: @report.errors.full_messages },
            status: :unprocessable_entity
  end
end
