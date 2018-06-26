class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post , only: [:create,:destroy]
  def create
    unless @post.liking_users.include? current_user
      @like = @post.likes.create(user: current_user)
    else
      @post.likes.find_by(user: current_user).destroy
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
