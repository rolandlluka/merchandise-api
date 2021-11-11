# spec/integration/admin/products_spec.rb
require 'swagger_helper'

describe 'Products API' do

  path '/api/admin/products' do
    get 'Retrieves all products. Admin only 🔒' do
      tags 'Products'
      security [Authorization: []]
      produces 'application/json'

      response '200', 'users retrieved' do
        xit
      end

      response '404', 'users not found' do
        xit
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        xit
      end
    end
  end

  path '/api/admin/products' do

    post 'Creates a product. Admin only 🔒' do
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
        required: ['name', 'price']
      }

      response '201', 'product created' do
        let(:product) { { name: 'foo', price: 23.4, code: 'MUG' } }
        xit
      end

      response '422', 'invalid request' do
        let(:product) { { name: 'foo' } }
        xit
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        xit
      end
    end
  end

  path '/api/admin/products/{product_id}' do

    put 'Updates a product. Admin only 🔒' do
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
        required: ['price']
      }

      response '200', 'product updated' do
        let(:product) { { price: 23.4 } }
        xit
      end

      response '422', 'invalid request' do
        let(:product) { { name: 'foo' } }
        xit
      end

      response '401', 'Missing token' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('bogus:bogus')}" }
        xit
      end
    end
  end

  path '/api/admin/products/show_items_price' do
    get 'Retrieves total price for a list of products.' do
      tags 'Products'
      description <<~TEXT
        ## Description
        Please use one of the predefined products: MUG, TSHIRT, HOODIE
      TEXT
      produces 'application/json'
      parameter name: 'items[]', in: :query, required: true, schema: {
        type: :array,
        items: {
          type: :string,
          nullable: true,
          description: 'Kind of items',
          example: 'MUG'
        }
      }

      response '200', 'prices retrieved' do
        schema type: :object,
               properties: {
                 Items: { type: :object },
                 Total: { type: :string }
               },
               required: %w[Items Total]

        let(:Items) { ['MUG'] }
        let(:Total) { ['23.4€'] }
        xit
      end

      response '404', 'price not found' do
        xit
      end

      response '400', 'bad request' do
        xit
      end
    end
  end
end