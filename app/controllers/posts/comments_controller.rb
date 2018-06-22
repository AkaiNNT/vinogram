class Posts::CommentsController < ApplicationController
  before_action :set_post ,only: [:create, :update, :destroy]
  before_action :set_cmt ,only: [:destroy, :update]

  def create
    @comment = @post.comments.create(content: params[:comment][:content],user_id: current_user.id)
    unless @comment.errors.present?
      respond_to do |format|
        format.html { redirect_to post_path }
        format.js
      end
    end
  end

  def update
    @comment.update(comment_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
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