class Api::V1::ListingsController < ApplicationController
  before_action :set_listing, only: %i[show destroy]

  def index
    if params[:status]
      @listings = current_user.listings.where(status: params[:status])
    else
      @listings = current_user.listings
    end
    render json: @listings 
  end

  def show
    render json: @listing
  end

  def new
    @listing = Listing.new
  end

  def create
    result = Listings::Create.call(user: current_user, listing_params: listing_params)

    if result[:status] == :success
      redirect_to root_url
    else
      @listings = result[:record]
      render :new
    end
  end

  def destroy
    result = Listings::Destroy.call(listing: listing)

    if result[:status] == :success
      redirect_to root_url
    else
      @listing = result[:record]
    end
  end

  private

  def set_listing
    @listing = current_user.listings.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:brand, :model, :body_type, :trip, :color, :price, :fuel, :year, :engine_capacity, :phone_number, :name, :image, :status)
  end
end
