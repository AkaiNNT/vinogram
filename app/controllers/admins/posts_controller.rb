class Admins::PostsController < Admins::BaseController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
end
