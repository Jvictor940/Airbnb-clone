class ReservationsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        reservations = Reservation.all
        render json: reservations 
    end

    def show
        reservation = Reservation.find(params[:id])
        render json: reservation 
    end 

    def create
        reservation = Reservation.create!(reservation_params)
        render json: reservation, status: :created
    end

    def destroy 
        reservation = Reservation.find(params[:id])
        reservation.destroy
        head.no_content
    end

    private 

    def reservation_params
        params.permit(:user_id, :home_id, :start_date, :end_date, :price)
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: "Image Not Found"}, status:  :not_found
    end
end
