class AssignmentNotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @assignment_notes = current_user.assignments.find(params[:assignment_id]).assignment_notes
  end

  def show
    @assignment_note = current_user.assignments.find(params[:assignment_id]).assignment_notes.find(params[:id])
  end

  def new
    @assignment_note = AssignmentNote.new
    @assignment = Assignment.find(params[:assignment_id])
  end

  def create
    # AssignmentNote.create({
    #   user_id: current_user.id,
    #   assignment_id: assignment.id,
    #   text: assignment_notes.text
    # })

    @assignment_note = AssignmentNote.new(assignment_note_params)

    @assignment_note.user_id = current_user.id || current_user.manager?
    @assignment_note.save

    if @assignment_note.save
      redirect_to '/assignments'
    else
      flash[:error] = @assignment_note.errors.full_messages.join(". ")
      redirect_to :back
    end

  end

  def update
    assignment = Assignment.find(params[:assignment_id])
    assignment_note = AssignmentNote.find(params[:id])
    assignment_note.update_attributes(assignment_note_params)

  end

  def destroy
    assignment = Assignment.find(params[:assignment_id])
    assignment_note = AssignmentNote.find(params[:id]).destroy

    if assignment_note
      head 200
    else
      render :json => {error: "Can't delete assignment note"}, status: 400
    end

  end

  private

  def assignment_note_params
    params.require(:assignment_note).permit(:text, :assignment_id, :user_id)
  end

end
