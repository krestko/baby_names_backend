module Api::V1
  class ListsController < ApplicationController
    before_action :get_list, only: [:show, :update, :destroy] 

    def index
      @lists = List.order(:id)
      render json: @lists
    end
  
    def show
      if @list
      render json: @list
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end
  
    def create
      @list = List.new(list_params) 
      if @list.save
        render json: @list, status: :created
      else
        render json: @list.errors.full_messages
      end
    end
  
    def update
      if @list.update(list_params)
        render json: @list
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @list.destroy
      if @list.destroy
        head :no_content, status: :ok
      else
        render json: @list.errors, status: :unprocessable_entity
      end      
    end
  
    private
    
      def get_list
        @list = List.find(params[:id])
      end
  
      def list_params
        params.permit(:list_name)
      end
  end
end