class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_reader
    User.last
  end
end
