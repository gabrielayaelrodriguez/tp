class ListsController < ApplicationController
	before_action :common


	def index

		if !(cookies[:lists].nil?)
			@lists=Array.new()

			(cookies[:lists]).split(',').each do |url|

				@lists << List.find_by(url: "#{url}")

	    	end
	  		
	  	end
	end


	def show
	end

	def new
	  @list=List.new
	end

	def edit
	end

	def create
	  @list = List.new(list_params)
	 
	  if @list.save
	  	if !(cookies[:lists].nil?)
		  	stuff=cookies[:lists] + ',' + @list.url
		  	cookies[:lists]= stuff
		else
			cookies[:lists]=@list.url
		end

	  	redirect_to @list
	  else
	  	render 'new'
	  end
	end

	def update
	 
	  if @list.update(list_params)
	    redirect_to @list
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @list.destroy
	 
	  redirect_to lists_path
	end

	
	 
	private

	  def list_params
	    params.require(:list).permit(:name, :url)
	  end

	  def common
	    url=params[:id]
	    @list = List.find_by(url: "#{url}")
	  end


end
