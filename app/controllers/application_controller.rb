class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  add_breadcrumb :index, :root_path
end
