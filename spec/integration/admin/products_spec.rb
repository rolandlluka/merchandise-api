# spec/integration/admin/products_spec.rb
require 'swagger_helper'

describe 'Products API' do

  path '/api/admin/products' do
    get 'Retrieves all products' do
      tags 'Products'
      security [Authorization: []]
      produces 'application/json'

      response '200', 'users retrieved' do
        run_test!
      end

      response '404', 'users not found' do
        run_test!
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end

  path '/api/admin/products' do

    post 'Creates a product' do
      tags 'Products'
      security [Authorization: []]
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :number },
          code: { type: :string }
        },
        required: [ 'name', 'price' ]
      }

      response '201', 'product created' do
        let(:product) { { name: 'foo', price: 23.4, code: 'MUG' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:product) { { name: 'foo' } }
        run_test!
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end

  path '/api/admin/products/{product_id}' do

    put 'Updates a product' do
      tags 'Products'
      security [Authorization: []]
      produces 'application/json'
      consumes 'application/json'
      parameter name: :product_id, in: :path, type: :string

      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          price: { type: :number },
        },
        required: [ 'price' ]
      }

      response '200', 'product updated' do
        let(:product) { { price: 23.4 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:product) { { name: 'foo' } }
        run_test!
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end
end