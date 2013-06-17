class UsersController < ApplicationController 
	before_filter :ensure_admin, only: [:index, :destroy]
	def index
		@users = User.all
	end 

	def new
		@user = User.new
		#render :new
	end 

	def create
		@user = User.new(params[:user])
			if @user.save
				session['user_id'] = @user.id
				redirect_to root_path
			else 
				render :new
			end
		#render :create
	end

	def edit
		@user = User.find(params[:id])
		#render :edit
	end 

	def update
		@user = User.find(params[:id])
			if @user.update_attributes(params['user'])
				redirect_to users_path
			else 
				render :edit
			end
		#render :update
	end

	def show
		@user = User.find(params[:id])
		#render :show
	end 
	  
	def destroy
		User.find(params[:id]).delete
		redirect_to users_path
		#render :destroy
	end 

end 