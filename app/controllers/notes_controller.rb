class NotesController < ApplicationController
  skip_authorization_check

  def index
    @note = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    @note.notebook_id = params[:notebook_id]
    if @note.save
      redirect_to notebook_path(@note.notebook)
    else
      render :new
    end
  end

  def edit
    @note = Note.find params[:id]
  end

  def destroy
    @note = Note.find params[:id]
    @note.destroy
    redirect_to notebook_path(@note.notebook)
  end

  def update
    @note = Note.find params[:id]
    if @note.update(note_params)
      redirect_to notebook_path(@note.notebook)
    else
      render "edit"
    end
  end

  private

  def note_params
    params.require(:note).permit(:description,:text)
  end
end
