class Admins::BaseController < ActionController::Base
  layout 'cms'
  before_action :authenticate_admin!
end
