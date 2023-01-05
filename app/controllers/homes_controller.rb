class HomesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def index
    homes = Home.all render json: homes
end

def show
    home = Home.find(params[:id])
    render json: home, status: :created 
end

def create
    home = Home.create!(home_params)
    render json: home, status: :created 
end

def destroy
    home = Home.find(params[:id])
    home.destroy
    head :no_content 
end

private 

def home_params 
    params.permit(:home_type, :total_occupancy, :total_bedrooms, :total_bathrooms, :summary, :address, :has_tv, :has_kitchen, :has_air_con, :has_heating, :has_internet, :price, :owner_id, :latitude, :longitude, title) 
end

def render_unprocessable_entity_response(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
end 

def render_not_found_response
    render json: {error:"House Nopt Found"}, status: :not_found  
end
end
