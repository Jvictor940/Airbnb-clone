class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        reviews = Review.all 
        render json: reviews
    end

    def show 
        review = Review.find(params[:id])
        render json: review
    end

    def create 
        review = Review.create!(review_params)
        render json: review, status: :created
    end

    def destroy 
        review = Review.find(params[:id])
        review.destroy
        head :no_content
    end

    private 

    def review_params 
        params.permit(:reservation_id, :rating, :comment)
    end

    def render_unprocessable_entity_response(exception) 
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response 
        render json: {error: "Review Not Found"}, status: :not_found
    end
end
