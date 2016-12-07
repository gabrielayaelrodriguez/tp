class SimpleTasksController < ApplicationController
	
	def new
		@simpleTask=SimpleTask.new
	end

  def create
  	@list= List.find_by(params[:list_url])
  	@list_id=List.find_by(params[:list_url]).id

  	@simpleTask=SimpleTask.new(task_params)

	@simpleTask.list_id=@list_id

	@simpleTask.save

	redirect_to list_path(@list)
	end

  private

  def task_params
  	params.require(:simple_task).permit(:description, :state, :priority)
	end
end
