class RestaurantPizza < ApplicationRecord
    belongs_to :pizza 
    belongs_to :restaurant

    validates_inclusion_of :price, in: 1..30
end
