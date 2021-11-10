class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def render_errors(errors, status: 422, exception: nil)
    errors = [errors] unless errors.is_a?(Array)
    @exception = if exception
                   [exception.class.name, exception.message]
                 else
                   errors_list = {}
                   errors.each_with_index { |error, index| errors_list[index + 1] = [error[:source], error[:title]] }
                   errors_list
                 end
    render(json: { errors: errors }, status: status)
  end
end
