class MyController < ApplicationController
  before_action :authenticate_user!

  def index
    response = HTTParty.get('https://www.googleapis.com/userinfo/v2/me', headers: {
      'Authorization' => "Bearer #{current_user.token}"
    })
    # do something with the response...
  end
end
