# Mostly based on Flatiron boiler plate, minus the destroy and update methods
class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create , :profile]   # make sure the user is authorized, unless they are making an account

  def profile
    render json: {
        user: logged_in_user ,
       organization: logged_in_user.organization ,
        organization_name: logged_in_user.organization ? logged_in_user.organization.name : nil
      }, status: :accepted
  end 

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      @user.save
      render json: { user: @user, token: token }
    else
      render json: { 
        message: 'This user might exist maybe but actually kind of really?',
        errors: @user.errors.full_messages
       }
    end
  end

  def update
    @user = User.find_by(id: params[:id], email: user_params[:email])
    @user.update(user_params)
    @user = @user.errors.full_messages if @user.errors.any?
    render json: {user: @user , organization: @user.organization}
  end

  def join_organization
    @user = User.find_by(id: params[:user_id])
    @organization = Organization.find_by(id: params[:organization_id])
    @user.organization_id = @organization.id
    
    render json: {user: @user , organization: @organization} if @user.save
  end

  def quit_organization
    @user = User.find_by(id: params[:user_id])
    @user.organization_id = nil
    render json: @user if @user.save
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.delete
    if @user.errors
      render json: @user.errors.full_messages
    else
      render json: @user
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :organization_id)
  end
end
