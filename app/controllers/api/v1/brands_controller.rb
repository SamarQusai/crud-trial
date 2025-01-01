class Api::V1::BrandsController < ApplicationController
  before_action :getBrand, only: [:edit]
  protect_from_forgery with: :null_session
  DEFAULT_LIMIT = 25
  DEFAULT_OFFSET = 0

  def show
      brands = Brand.order(_id: :desc)
                .limit(params[:limit] || DEFAULT_LIMIT)
                .offset(params[:offset] || DEFAULT_OFFSET)
      if brands
        render json: brands.to_json(only: [:_id, :nameEn, :active]), status: :ok
      else
        render json: {message: "no dara found"}, status: :unprocessable_entity
      end
  end

  def create
    brand = Brand.new(brand_params)
    if brand.save
        render json: brand, status: :ok
    else
        render json: {message: ""}, status: :unprocessable_entity
    end
  end

  def edit
    if @brand
        if @brand.update(brand_params)
            render json: {message: "success"}, status: :ok
        else
            render json: {message: "update failed"}, status: :unprocessable_entity
        end
    else
      render json: {message: "user not found"}, status: :unprocessable_entity
    end
  end

  private
        # Define allowed parameters.
   def brand_params
        params.require(:brand).permit(:nameEn, :active)
   end

   def getBrand
        @brand = Brand.find_by _id: params[:id]
   end
end
