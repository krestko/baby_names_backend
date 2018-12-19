module Api::V1
  class NamesController < ApplicationController
    before_action :get_list
    before_action :get_name, only: [:show, :update, :destroy] 

    def index
      @names = @list.names
      render json: @names
    end
  
    def show
      render json: @name
    end
  
    def create
      @name = Name.new(name_params) 
      if @name.save
        render json: @name, status: :created
      else
        render json: @name.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @name.update(name_params)
        render json: @name
      else
        render json: @name.errors, status: :unprocessable_entity
      end
    end
  
    private

      def get_list
        @list = List.find(params[:list_id])
      end

      def get_name
        @name = Name.find(params[:id])
      end
  
      def name_params
        params.permit(:baby_name).merge(list_id: params[:list_id].to_i)
      end
  end
  end