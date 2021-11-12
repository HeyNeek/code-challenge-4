class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create 
        restaurant_pizza = RestaurantPizza.create!(price: params[:price], pizza_id: params[:pizza_id], restaurant_id: params[:restaurant_id])
        render json: restaurant_pizza.pizza, status: :created
    end

    private 

    def render_not_found_response
        render json: {error: "Restaurant Pizza not found"}, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 
end
