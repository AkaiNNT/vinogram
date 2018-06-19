class Admins::DashboardsController < Admins::BaseController
  def index
    @user_nums = User.count
    @post_nums = Post.count
    @comment_nums = Comment.count
  end
end
