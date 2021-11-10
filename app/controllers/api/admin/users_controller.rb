# frozen_string_literal: true

module Api
  module Admin
    class UsersController < Api::BaseController
      before_action :authenticate

      def index
        render json: User.all
      end
    end
  end
end