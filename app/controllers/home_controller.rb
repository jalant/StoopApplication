class HomeController < ApplicationController


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
end
