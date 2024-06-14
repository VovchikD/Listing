# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Listings::Create, type: :service do
  let(:user) { create(:user) }

  context 'when announcement creation is successful' do
    let(:listing_params) { attributes_for(:listing, user: user) }

    it 'returns success result' do
      result = Listings::Create.call(user: user, listing_params: listing_params)
      expect(result[:status]).to eq(:success)
      expect(result[:record].brand).to eq('Toyota')
    end

    context 'when announcement failure' do
      let(:listing_params) { nil }

      it 'returns failure result' do
        result = Listings::Create.call(user: user, listing_params: listing_params)
        expect(result[:status]).to eq(:failure)
      end
    end
  end
end