class Admin::DashboardController < ApplicationController
  before_action :set_listing, only: [:show, :approve, :reject]

  def index
    @listings = Listing.where(status: :pending)
  end

  def show
  end

  def approve
    if @listing
      @listing.approved!
      redirect_to admin_listings_path, notice: 'Listing approved successfully.'
    else
      redirect_to admin_listings_path, alert: 'Listing not found.'
    end
  end

  def reject
    if @listing
      @listing.rejected!
      redirect_to admin_listings_path, notice: 'Listing rejected successfully.'
    else
      redirect_to admin_listings_path, alert: 'Listing not found.'
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
