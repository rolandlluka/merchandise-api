# spec/integration/admin/users_spec.rb
require 'swagger_helper'

describe 'Users API' do

  path '/api/admin/users' do

    get 'Retrieves all users' do
      tags 'Users'
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
end