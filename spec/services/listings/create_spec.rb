# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Listings::Create, type: :service do
  let(:user) { create(:user) }

  describe 'call' do
    context 'when announcement creation is successful' do
      let(:listing_params) {
      { brand: "Toyota",
        model: "Camry",
        body_type: "Sedan",
        trip: 10000,
        color: "Red",
        price: 20000,
        fuel: "Petrol",
        year: 2020,
        engine_capacity: 2.5,
        phone_number: "1234567890",
        name: "John Doe" }
      }

      it 'returns success result' do
        result = Listings::Create.call(user: user, listing_params: listing_params)
        expect(result[:status]).to eq(:success)
        expect(result[:record].brand).to eq('Toyota')
      end
    end

    context 'when announcement failure' do
      let(:listing_params) { nil }

      it 'returns failure result' do
        result = Posts::Create.call(user: user, listing_params: listing_params)
        expect(result[:status]).to eq(:failure)
      end
    end
  end
end