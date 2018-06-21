class Posts::CommentsController < ApplicationController
  before_action :set_post ,only: [:create, :update, :destroy]
  def create
    @comment = @post.comments.create(content: params[:comment][:content],user_id: current_user.id)
    unless @comment.errors.present?
     redirect_to posts_path
    end
  end


  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end

end