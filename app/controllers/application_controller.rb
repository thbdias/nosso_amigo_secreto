class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  # vai recuperar o app quando acontecer alguma coisa em qualquer controller
  # como -> not_found, erro interno...
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    # mandando para a home
    redirect_to main_app.root_url
  end
end
