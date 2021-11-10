# frozen_string_literal: true
module Api
  class BaseController < ApplicationController

    private

    def authenticate
      (token && sign_in_user_from_token) || render_invalid_token_error
    end

    def token
      @token ||= request.headers['Authorization']
    end

    def current_user
      @current_user ||= sign_in_user_from_token
    end

    def sign_in_user_from_token
      user = User.find_by(token: token)
      return unless user

      @current_user = user
    end

    def render_invalid_token_error
      render_errors({ source: 'Authorization', title: 'Missing token' }, status: 401)
    end
  end
end