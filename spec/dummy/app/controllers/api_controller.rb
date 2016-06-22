class ApiController < ActionController::Base
  def demo
    render json: params.except(:action, :controller, :path).to_json
  end
end
