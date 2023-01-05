class ImagesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        images = Image.all 
        render json: images
    end
    
    def show
        image = Image.find(params[:id])
        render json: image, status: :created 
    end
    
    def create
        image = Image.create!(image_params)
        render json: image, status: :created 
    end
    
    def destroy
        image = Image.find(params[:id])
        image.destroy
        head :no_content 
    end
    
    private 

    def review_params
        params.permit(:home_id, :room_type, :img)
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: "Image Not Found"}, status:  :not_found
    end
end
