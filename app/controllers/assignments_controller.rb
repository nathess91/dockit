class AssignmentsController < ApplicationController

  def index
    @assignments = current_user.assignments
  end

  def show
    @assignment = current_user.assignments.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_user.assignments.create(assignment_params)

    if @assignment.valid?
      redirect_to '/home'
    else
      render :new
    end

  end

  private

  def assignment_params
    params.require(:assignment).permit(
        :name, :date_assigned, :original_insp_date, :return_insp_date,
        :job_number, :loss_category, :loss_description, :mitigation_status,
        :abatement_status, :claim_number, :estimate_status, :target_start_date,
        :target_end_date, :actual_start_date, :actual_end_date, :is_on_xa,
        :estimator_experience, :estimate_total, :assignment_stage, :lost_sales_related,
        :lost_other, :is_contract_signed, :year_built, :address)
  end

end
