# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { User.create name: 'Admin', token: 'some-test-token' }
  subject(:product) { Product.create! name: 'MUG', code: 'MUG', price: 12.2, user: user }

  describe 'validations' do
    it { is_expected.to be_valid }

    describe 'when user_id is not present' do
      before { product.user_id = nil }
      it { is_expected.to be_invalid }
    end

    describe 'when name is not present' do
      before { product.name = nil }
      it { is_expected.to be_invalid }
    end
  end
end
