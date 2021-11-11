# spec/integration/admin/users_spec.rb
require 'swagger_helper'

describe 'Users API' do

  path '/api/admin/users' do

    get 'Retrieves all users. Admin only 🔒' do
      tags 'Users'
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
end