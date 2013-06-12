class SalesController < ApplicationController

  def index
    @sales = Sale.all
    @neighborhoods = Neighborhood.all
    @users = User.all

    maps = Geocoder.search("Brooklyn, New York")
    lat_lng = maps.first.data["geometry"]['location']
    @map_lat = lat_lng["lat"]
    @map_lng = lat_lng["lng"]

    @locations = []

    @sales.each do |sale|
      address_tmp = "#{sale.address}, #{sale.city}"
      @marker = Geocoder.search(address_tmp)
      mark_lat = @marker.first.data["geometry"]['location']['lat']
      mark_lng = @marker.first.data["geometry"]['location']['lng']
      @locations << [sale.title, mark_lat, mark_lng]
    end
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
