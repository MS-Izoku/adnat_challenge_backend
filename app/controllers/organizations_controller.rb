class OrganizationsController < ApplicationController
    skip_before_action :authorized

    def index
        organizations = Organization.all
        render json: organizations
    end

    def show
        organization = Organization.find_by(id: params[:id])
        render json: organization
    end

    def create
        organization = Organization.create(organization_params)
        render json: organization
    end

    def update
        organization = Organization.find_by(id: params[:id])
        organization.update(organization_params)
        render json: organization
    end

    def delete
        organization = Organization.find_by(id: params[:id])
        organization.delete
        render json: organization
    end

    private
    def organization_params
        params.require(:organization).permit(:name , :hourly)
    end
end
