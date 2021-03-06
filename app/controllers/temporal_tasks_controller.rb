class TemporalTasksController < ApplicationController
	before_action :findparent
	before_action :findtask, only: [:update, :edit, :destroy]
	
	def new
		@temporalTask=TemporalTask.new
	end

	def edit
	end

  	def create

	  	@temporalTask=TemporalTask.new(task_params)

		@temporalTask.list_id=@list.id
		
		if @temporalTask.save

			redirect_to list_path(@list)
		else
			render 'new'
		end
	end

	def update
	  if @temporalTask.update(task_params)
	    redirect_to @list
	  else
	    render 'edit'
	  end
	end
	

	def destroy
	    @temporalTask.destroy
	    redirect_to list_path(@list)
	end


  private

  def findtask
  	@temporalTask=TemporalTask.find(params[:id])
  end

  def findparent
	  url=params[:list_id]
	  @list = List.find_by(url: "#{url}")
	end

  def task_params
  	params.require(:temporal_task).permit(:description, :state, :priority, :validation_start, :validation_end)
	end


end