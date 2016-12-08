class ListsController < ApplicationController
	before_action :common
	before_action :ini_array

	def index
		cookie_list

		cookies[:lists]= array.split(',')

		if (cookies[:lists]!='')
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


	  	array<<@list.name
	  	array.join(',')


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

	  def cookie_list
	  	cookies[:cookieList] ||= ''
	  end

	  def ini_array
	  	array[] ||= ''
	  end
end
