class ItemsController < ApplicationController

  def index
    @items = Item.all

    #render :index
  end

  def create
    item = Item.create(name: params[:item][:name].downcase, price: params[:item][:price], description: params[:item][:description])
    if item.save
      redirect_to items_path
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


  def search

    @items = Item.where(name: params[:query].downcase)
    @sales = Sale.all
    @neighborhoods = Neighborhood.all
    @users = User.all


    if @items.any?
      maps = Geocoder.search("#{@items.first.sale.address}, Brooklyn, New York")
      lat_lng = maps.first.data["geometry"]['location']
      @map_lat = lat_lng["lat"]
      @map_lng = lat_lng["lng"]

      @locations = []

      address_tmp = "#{@items.first.sale.address}, Brooklyn, New York"
      @marker = Geocoder.search(address_tmp)
      mark_lat = @marker.first.data["geometry"]['location']['lat']
      mark_lng = @marker.first.data["geometry"]['location']['lng']
      tmp_url = "sales/#{@items.first.sale.id}"
      @locations << [@items.first.sale.title, @items.first.sale.address, mark_lat, mark_lng, @items.first.sale.date, tmp_url]
    end
    render :search_result

  end


end
