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
      if sale.date.to_date > Date.today
        
        address_tmp = "#{sale.address}, Brooklyn, New York"
        @marker = Geocoder.search(address_tmp)
        mark_lat = @marker.first.data["geometry"]['location']['lat']
        mark_lng = @marker.first.data["geometry"]['location']['lng']
        tmp_url = "sales/#{sale.id}"
        @locations << [sale.title, sale.address, mark_lat, mark_lng, sale.date, tmp_url]
      end
    end
  end

  def create
    sale = Sale.create(params[:sale])
    params[:sale]["items_attributes"].each do |item|
      tmp_item = Item.create(name: item[1]['name'], price: item[1]['price'].to_i, description: item[1]['description'])
      sale.items << tmp_item
    end
    sale.date = "#{params[:date][:year]}-#{params[:date][:month]}-#{params[:date][:day]}"
    current_user.sales << sale
    if sale.save!
      redirect_to sales_path
    else
      redirect_to new_sale_path
    end
    #render :create
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

    @users = User.all

    maps = Geocoder.search("#{@sale.address},Brooklyn, New York")
    lat_lng = maps.first.data["geometry"]['location']
    @map_lat = lat_lng["lat"]
    @map_lng = lat_lng["lng"]

    @locations = []

    address_tmp = "#{@sale.address}, #{@sale.city}"
    @marker = Geocoder.search(address_tmp)
    mark_lat = @marker.first.data["geometry"]['location']['lat']
    mark_lng = @marker.first.data["geometry"]['location']['lng']
    @locations << [@sale.title, mark_lat, mark_lng]

  end

  def destroy
    Sale.find(params[:id]).delete
    redirect_to sales_path
    #render :destroy
  end
end
