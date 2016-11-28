class AssignmentContactsController < ApplicationController
  def index
    @assignment_contacts = AssignmentContact.all
  end

  def new
    @assignment_contact = AssignmentContact.new
  end

  def create
    @assignment_contact = AssignmentContact.new(assignment_contact_params)

    if @assignment_contact.save
      flash[:success] = "New contact successfully created"
      redirect_to '/assignments'
    else
      flash[:error] = @assignment_contact.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  def edit
    @assignment_contact = AssignmentContact.find(params[:id])
  end

  def update
  end

  def destroy
    @assignment_contact = AssignmentContact.find(params[:id])
    if @assignment_contact.destroy
      flash[:success] = "Contact deleted successfully"
      redirect_to '/assignments'
    else
      flash[:error] = @assignment_contact.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  private

  def assignment_contact_params
    params.require(:assignment_contact).permit(:assignment_id, :role, :name, :phone, :email)
  end
end
