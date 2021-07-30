class BreaksController < ApplicationController
    def index
        work_breaks = Break.where(shift_id: break_params[:shift_id])
        render json: work_breaks
    end

    def create
        work_break = Break.create(break_params)
        render json: work_break
    end

    def update
        work_break = Break.update(break_params)
        render json: work_break
    end

    def destroy
        work_break = Break.update(break_params)
        render json: work_break
    end

    private
    def break_params
        params.require(:shift).permit(:start , :finish, :shift_id)
    end
end
