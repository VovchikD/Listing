# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Listings::Destroy, type: :service do
  let(:listing) { create(:listing)}

  it 'when announcement is successfully destroy' do
    result = Listings::Destroy.call(listing: listing)
    expect(result[:status]).to eq(:success)
  end

  it 'when announcement is failure destroy' do
    allow(listing).to receive(:destroy)
    result = Listings::Destroy.call(listing: listing)
    expect(result[:status]).to eq(:failure)
  end
end