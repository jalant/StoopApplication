class HomeController < ApplicationController


  def index

    @neighborhood = "Williamsburg"

    maps = Geocoder.search("Williamsburg, Brooklyn, New York")
    lat_lng = maps.first.data["geometry"]['location']
    @map_lat = lat_lng["lat"]
    @map_lng = lat_lng["lng"]
    # binding.pry

    @sales = Sale.all

    @locations = []

    @sales.each do |sale|

      if sale.user.neighborhood.name == @neighborhood
        address_tmp = "#{sale.address}, #{sale.city}"
        @marker = Geocoder.search(address_tmp)
        mark_lat = @marker.first.data["geometry"]['location']['lat']
        mark_lng = @marker.first.data["geometry"]['location']['lng']
        @locations << [sale.title, mark_lat, mark_lng]

      end
    end
  end
end
