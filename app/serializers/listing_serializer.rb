class ListingSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :body_type, :trip, :color, :price, :fuel, :year, :engine_capacity, :phone_number, :name, :image, :status
end