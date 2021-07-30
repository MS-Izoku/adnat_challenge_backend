class ShiftsController < ApplicationController
    skip_before_action :authorized, only: [:index , :create]
    
    # we will need all shifts of a given user
    def index
        # the organization_id is provided by the user model
        org = Organization.find_by(id: params[:organization_id])
        shifts = Shift.where(organization_id: org.id)
        render json: shifts
    end

    def create
        shift = Shift.new(shift_params)
        if shift.errors.any?
            shift = shift.errors.full_messages
        else
            shift.save
        end

        render json: shift
    end

    def update
        shift = Shift.find_by(id: params[shift_id])
         # assign attributes to the 
        shift.assign_attributes(start: shift_params[:start], finish: shift_params[:finish])
        if shift.valid?
            shift.save
        else
            # render errors if there are errors updating
            shift = shift.errors.full_messages
        end

        render json: shift
    end

    def destroy
        shift = Shift.find_by(id: params[:id] , user_id: shift_params[:user_id])
        if shift
            shift.delete
        else
            shift = shift.errors.full_messages
        end

        render json: shift
    end

    private
    def shift_params
        params.require(:shift).permit(:start , :finish, :user_id , :break_length)
    end
end
