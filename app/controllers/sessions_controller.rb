class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    logger.debug "auth_hash=#{auth_hash}"
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
