
module Listings
  class Destroy < BaseService
    def initialize(listing)
      @listing = listing
    end

    def self.call(listing:)
      new(listing).call
    end

    def call
      if @listing.destroy
        success_result(@listing)
      else
        failure_result(@listing)
      end
    end
  end
end