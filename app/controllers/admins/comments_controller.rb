class Admins::CommentsController < Admins::BaseController
  before_action :search_form
  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  private

  def search_form
    @search = ""
  end
end
