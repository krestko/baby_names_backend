module Api::V1
  class UsersController < ApplicationController
    before_action :get_user, only: [:show, :update] 

    def index
      @users = User.order(:id)
      render json: @users
    end
  
    def show
      if @user
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def get_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:user_name, :recently_viewed_list)
    end
  end
end