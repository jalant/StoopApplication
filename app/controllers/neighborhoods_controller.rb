class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    neighborhood = Neighborhood.find(params[:id])
    if neighborhood.update_attributes(params[:neighborhood])
      redirect_to neighborhoods_path
    else
      redirect_to edit_neighborhood_path
    end
  end

  def create
    neighborhood = Neighborhood.new(params[:neighborhood])
    if neighborhood.save!
      redirect_to neighborhoods_path
    else
      redirect_to new_neighborhood_path
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end



  def destroy
    Neighborhood.find(params[:id]).delete
    redirect_to neighborhoods_path
  end




end
