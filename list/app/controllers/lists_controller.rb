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
	  		a=(cookies[:lists]).split(',')
	  		if (a.size<5)
		  		stuff=cookies[:lists] + ',' + @list.url
		  		cookies[:lists]= stuff
		  	else
		  		a.shift
		  		a.push @list.url
		  		a=a.join(',')
		  		cookies[:lists]=a
		  		
		  	end
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
	  a=(cookies[:lists]).split(',')
	  a.delete(@list.url)

	  if (a.size>0)
	  	a.join(',')
	  	cookies[:lists]=a
	  else
	  	cookies.delete :lists
	  end
	  

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
