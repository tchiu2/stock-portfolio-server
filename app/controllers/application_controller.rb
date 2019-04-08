class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource, key_transform: :camel_lower
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: resource.errors
    }, status: :bad_request
  end
end
