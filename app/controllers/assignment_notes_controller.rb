class AssignmentNotesController < ApplicationController

  def index
    render :json => Assignment_Note.all
  end

  def show
    assignment = Assignment.find(params[:assignment_id])
    render :json => assignment.assignment_notes.find(params[:id])
  end

  def create
    assignment = Assignment.find(params[:assignment_id])
    assignment_note = assignment.assignment_notes.new(assignment_note_params)

    assignment_note.user_id = current_user.id
    assignment_note.save
  end

  def update
    assignment = Assignment.find(params[:assignment_id])
    assignment_note = Assignment_Note.find(params[:id])
    assignment_note.update_attributes(assignment_note_params)

    if assignment_note
      head 200
    else
      render :json => {error: "Can't update assignment note"}, status: 400
    end

  end

  def destroy
    assignment = Assignment.find(params[:assignment_id])
    assignment_note = Assignment_Note.find(params[:id]).destroy

    if assignment_note
      head 200
    else
      render :json => {error: "Can't delete assignment note"}, status: 400
    end

  end

  private

  def assignment_note_params
    params.require(:assignment_note).permit(:text)
  end

end
