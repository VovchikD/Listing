# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ListingsController, type: :controller do
  let(:user) { create(:user) }
  let(:listing_params) { attributes_for(:listing, user: user) }
  let(:listing) { Listing.create(attributes_for(:listing, user: user)) } 

  before { sign_in user }

  it "return success response" do
    get :index
    expect(response).to be_successful
  end

  it "creates new listing" do
    expect {
      post :create, params: { listing: listing_params }
    }.to change(Listing, :count).by(1)
  end

  it "destroy listing" do
    delete :destroy, params: { id: listing.id }
    expect(Listing.last).to be_nil
  end
end