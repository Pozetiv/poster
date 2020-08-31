class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_authorize
end
