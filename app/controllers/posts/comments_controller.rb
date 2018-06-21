class Posts::CommentsController < ApplicationController
  before_action :set_post ,only: [:create, :update, :destroy]
  before_action :set_cmt ,only: [:destroy]

  def create
    @comment = @post.comments.create(content: params[:comment][:content],user_id: current_user.id)
    unless @comment.errors.present?
     redirect_to posts_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_cmt
    @comment = @post.comments.find(params[:id])
  end

end