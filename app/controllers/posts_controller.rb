class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      if params[:image]
        params[:image].each { |image|
          @post.pictures.create(image: image)}
      end
      redirect_to posts_path
    else
      flash[:warning] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def post_params
      params.required(:post).permit(:content, pictures_attributes: [:id, :image])
  end

end