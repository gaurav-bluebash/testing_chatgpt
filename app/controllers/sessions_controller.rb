class SessionsController < ApplicationController
  def create
  	debugger
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.token = auth['credentials']['token']
    end
    session[:user_id] = user.id
    redirect_to root_path
  end
end
