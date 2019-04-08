class SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    render json: resource, key_transform: :camel_lower
  end

  def respond_to_on_destroy
    ##head :no_content
    render json: {}
  end
end
