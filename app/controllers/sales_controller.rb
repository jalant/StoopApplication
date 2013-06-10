class SalesController < ApplicationController 

	def index
		@sales = Sale.all
		#render :index
	end 

	def create
		sale = Sale.create(params[:sale])
			if sale.save!
				redirect_to sales_path
			else 
				redirect_to new_sale_path
			end
		#render :create
	end


	def new
		@sale = Sale.new()
		#render :new
	end 

	def edit
		@sale = Sale.find(params[:id])
		#render :edit
	end 

	def update
		sale = Sale.find(params[:id])
			if sale.update_attributes(params['sale'])
				redirect_to sales_path
			else 
				redirect_to new_sale_path
			end
		#render :update
	end

	def show
		@sale = Sale.find(params[:id])
		#render :show
	end 
	  
	def destroy
		Sale.find(params[:id]).delete
		redirect_to sales_path
		#render :destroy
	end 


end 