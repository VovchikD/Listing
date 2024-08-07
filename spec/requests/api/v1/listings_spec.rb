require 'swagger_helper'

RSpec.describe 'api/v1/listings', type: :request do
  let(:user) { create(:user) }
  let!(:listing) { create(:listing, user: user) }

  before { sign_in user }

  path '/api/v1/listings' do
    get('list listings') do
      tags 'Listings'
      consumes 'application/json'
      produces 'application/json'
      
      response(200, 'successful') do
        run_test! do |response|
          expect(response).to have_http_status(:ok)
        end
      end
    end

    post('create listing') do
      tags 'Listings'
      response(201, 'created') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :listing, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          model: { type: :string }
        },
        required: %w[name model]
      }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/listings/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'ID'
  
    get('show listing') do
      tags 'Listings'
      response(200, 'successful') do
      consumes 'application/json'
      produces 'application/json'
      schema type: :object, properties: {
        id: { type: :string },
        brand: { type: :string },
        model: { type: :string }
      }
      let(:id) { listing.id } 
        run_test!
      end
    end

    delete('delete listing') do
      tags 'Listings'
      response(200, 'successful') do
      consumes 'application/json'
      produces 'application/json'
      let(:id) { listing.id } 
        run_test!
      end
    end
  end

  path '/' do
    get('list listings') do
      tags 'Listings'
      response(200, 'successful') do
      consumes 'application/json'
      produces 'application/json'
        run_test!
      end
    end
  end
end
