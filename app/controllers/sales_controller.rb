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
      tmp_url = "sales/#{sale.id}"
      @locations << [sale.title, sale.address, mark_lat, mark_lng, sale.date, tmp_url]
    end
  end

  def create
    sale = Sale.create(params[:sale])
    params[:sale]["items_attributes"].each do |item|
    tmp_item = Item.create(name: item[1]['name'], price: item[1]['price'].to_i, description: item[1]['description'])
    sale.items << tmp_item
    end
    current_user.sales << sale
    if sale.save!
      redirect_to sales_path
    else
      redirect_to new_sale_path
    end
    #render :create
  end

  #custom method for form
  def item_form
    #render partial 'full_path_to_partial_or_name_of_view'

  end

  def new
    @sale = Sale.new
    10.times{@sale.items.build}
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
