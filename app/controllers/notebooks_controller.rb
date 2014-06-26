class NotebooksController < ApplicationController

	def index
		@notebooks = Notebook.all
	end

	def show
		@notebook = Notebook.find(params[:id])
	end

	def new
		@notebook = Notebook.new
	end

	def create
		@notebook = Notebook.create notebook_params
		if @notebook.save
			redirect_to notebook_path(@notebook)
		else
			render :new
		end
	end

	def edit
		@notebook = Notebook.find params[:id]
	end

	def destroy
		@notebook = Notebook.find params[:id]
		Notebook.delete @notebook
		redirect_to root_path
	end

	def update

	end

	private
	def notebook_params
		params.require(:notebook).permit(:description)
	end

end
