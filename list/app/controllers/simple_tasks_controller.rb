class SimpleTasksController < ApplicationController
	before_action :findparent
	before_action :findtask, only: [:update]
	
	def new
		@simpleTask=SimpleTask.new
	end

	def edit
		@simpleTask=@list.tasks.find(params[:id])
	end

  	def create

	  	@simpleTask=SimpleTask.new(task_params)

		@simpleTask.list_id=@list.id

		@simpleTask.save

		redirect_to list_path(@list)
	end

	def update
	  if @simpleTask.update(task_params)
	    redirect_to @list
	  else
	    render 'edit'
	  end
	end
	

	def destroy
	    @task = @list.tasks.find(params[:id])
	    @task.destroy
	    redirect_to list_path(@list)
	end


  private

  def findtask
  	@simpleTask=SimpleTask.find(params[:id])
  end

  def findparent
	  url=params[:list_id]
	  @list = List.find_by(url: "#{url}")
	end

  def task_params
  	params.require(:simple_task).permit(:description, :state, :priority)
	end
end
