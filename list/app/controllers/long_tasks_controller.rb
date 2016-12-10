class LongTasksController < ApplicationController
	before_action :findparent
	before_action :findtask, only: [:update, :edit, :destroy]
	
	def new
		@longTask=LongTask.new
	end

	def edit
	end

  	def create

	  	@longTask=LongTask.new(task_params)

		@longTask.list_id=@list.id

		if @longTask.save

			redirect_to list_path(@list)
		else
			render 'new'
		end
	end

	def update
	  if @longTask.update(task_params)
	    redirect_to @list
	  else
	    render 'edit'
	  end
	end
	

	def destroy
	    @task.destroy
	    redirect_to list_path(@list)
	end


  private

  def findtask
  	@longTask=LongTask.find(params[:id])
  end

  def findparent
	  url=params[:list_id]
	  @list = List.find_by(url: "#{url}")
	end

  def task_params
  	params.require(:long_task).permit(:description, :state, :priority, :percentage)
	end
end