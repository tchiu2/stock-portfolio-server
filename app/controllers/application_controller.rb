class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :authenticate_user!

  respond_to :json

  def render_resources(resources)
    render json: resources, key_transform: :camel_lower, status: 200
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource, key_transform: :camel_lower, status: 200
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
