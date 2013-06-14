class ItemsController < ApplicationController 

	def index
		@items = Item.all
		#render :index
	end 

	def create
		item = Item.create(params[:item])
			if item.save!
				render :back
			else 
				redirect_to new_item_path
			end
		#render :create
	end


	def new
		@item = Item.new()
		#render :new
	end 

	def edit
		@item = Item.find(params[:id])
		#render :edit
	end 

	def update
		item = Item.find(params[:id])
			if item.update_attributes(params['item'])
				redirect_to items_path
			else 
				redirect_to new_item_path
			end
		#render :update
	end

	def show
		@item = Item.find(params[:id])
		#render :show
	end 
	  
	def destroy
		Item.find(params[:id]).delete
		
		redirect_to sale_path(current_user.sales.first)
	end 


end 