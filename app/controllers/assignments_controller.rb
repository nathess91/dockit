class AssignmentsController < ApplicationController

  def index
    if current_user.admin?
      @assignments = Assignment.all
    else
      @assignments = current_user.assignments
    end
  end

  def show
    @assignment = current_user.assignments.find(params[:id])
  end

  def new
    @assignment = Assignment.new
    @assignment_note = AssignmentNote.new
  end

  def create
    @assignment = current_user.assignments.create(assignment_params)

    if @assignment.valid?
      flash[:success] = "New assignment created successfully"
      redirect_to '/assignments'
    else
      flash[:error] = @assignment.errors.full_messages.join(". ")
      redirect_to :back
    end

  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])

    if params[:assignment][:assignment_stage] == "closed"
      render :partial => "partials/checklist"
    elsif @assignment.update_attributes(assignment_params) && params[:assignment][:assignment_stage] != "closed"
      flash[:success] = "Assignment updated successfully"
      
      # redirect to appropriate tab based on stage
      if params[:assignment][:assignment_stage] == "assigned"
        redirect_to "/assignments#1"
      elsif params[:assignment][:assignment_stage] == "approved"
        redirect_to "/assignments#2"
      elsif params[:assignment][:assignment_stage] == "in_progress"
        redirect_to "/assignments#3"
      elsif params[:assignment][:assignment_stage] == "not_sold"
        redirect_to "/assignments#4"
      elsif params[:assignment][:assignment_stage] == "completed"
        redirect_to "/assignments#5"
      end

    else
      flash[:error] = @assignment.errors.full_messages.join(". ")
      redirect_to :back
    end

  end

  def destroy
    @assignment = current_user.assignments.find(params[:id])
    if @assignment.destroy
      flash[:success] = "Assignment deleted successfully"
      redirect_to '/assignments'
    else
      flash[:error] = @assignment.errors.full_messages.join(". ")
      redirect_to '/assignments'
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
        :lost_other, :is_contract_signed, :year_built, :address, :assignment_id, :user_id,
        :contact_role, :contact_name, :contact_phone, :contact_email, :company_category,
        :company_name)
  end

end
