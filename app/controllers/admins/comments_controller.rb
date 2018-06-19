class Admins::CommentsController < Admins::BaseController
  def index
    @comments = Comment.all.order(created_at: :desc)
  end
end
