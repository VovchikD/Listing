
module Listings
  class Create < BaseService
    def initialize(user, listing_params)
      @user = user
      @listing_params = listing_params
    end

    def self.call(user:, listing_params:)
      new(user, listing_params).call
    end

    def call
      @listing = @user.listings.build(@listing_params)
      if @listing.save
        success_result(@listing)
      else
        failure_result(@listing)
      end
    end
  end
end