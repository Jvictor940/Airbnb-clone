class HomeSerializer < ActiveModel::Serializer
  attributes :id, :title, :home_type, :total_occupancy, :total_bedrooms, :total_bathrooms, :summary, :address, :has_tv, :has_kitchen, :has_air_con, :has_internet, :price, :owner_id, :latitude, :longitude, :created_at

  has_many :images 
end
