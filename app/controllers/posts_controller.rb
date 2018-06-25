class PostsController < ApplicationController
  before_action :set_post ,only: [:update, :edit, :destroy]
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.new
    @posts = Post.all.order('created_at desc').paginate(:page => params[:page], :per_page => 6 )

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
      flash[:danger] = @post.errors.full_messages.join(", ")
      redirect_to posts_path
    end
  end

  def edit;  end

  def update
    asdsadsadsa
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
      params.required(:post).permit(:content,:attachment, pictures_attributes: [:id, :image, :_destroy])
  end

end
