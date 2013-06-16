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
    @sales = Sale.all
    @users = User.all

    name = @neighborhood.name
    maps = Geocoder.search("#{name},Brooklyn, New York", :timeout => 10)
    lat_lng = maps.first.data["geometry"]['location']
    @map_lat = lat_lng["lat"]
    @map_lng = lat_lng["lng"]

    @locations = []

   
    @sales.each do |sale|
      if sale.user.neighborhood.name == name
        address_tmp = "#{sale.address}, #{sale.city}"
        @marker = Geocoder.search(address_tmp, :timeout => 10)
        mark_lat = @marker.first.data["geometry"]['location']['lat']
        mark_lng = @marker.first.data["geometry"]['location']['lng']
        @locations << [sale.title, mark_lat, mark_lng]
    end
  end
end


  def destroy
    Neighborhood.find(params[:id]).delete
    redirect_to neighborhoods_path
  end

end
