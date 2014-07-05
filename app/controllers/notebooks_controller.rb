class NotebooksController < ApplicationController
  authorize_resource

  def index
    @notebooks = current_user.notebooks
  end

  def show
    @notebook = Notebook.find(params[:id])
    authorize! :show, @notebook
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new notebook_params
    @notebook.user = current_user
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
      render :new
    end
  end

  def edit
    @notebook = Notebook.find params[:id]
    authorize! :edit, @notebook
  end

  def destroy
    Notebook.find(params[:id]).destroy
    redirect_to root_path
  end

  def update
    @notebook = Notebook.find params[:id]
    if @notebook.update(notebook_params)
      redirect_to(@notebook)
    else
      render "edit"
    end
  end

  private

  def notebook_params
    params.require(:notebook).permit(:description)
  end
end
