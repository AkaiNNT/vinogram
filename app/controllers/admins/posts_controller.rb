class Admins::PostsController < Admins::BaseController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :search_form
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to admins_posts_path
  end
  private
  def find_post
    @post = Post.find(params[:id])
  end

  def search_form
    @search = ""
  end
end
