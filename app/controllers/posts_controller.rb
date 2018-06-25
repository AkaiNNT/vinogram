class PostsController < ApplicationController
  before_action :set_post ,only: [:update, :edit, :destroy]
  before_action :set_posts , only: [:index,:create]
  before_action :search_form
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def index
    @post = Post.new
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
      render :index
    end
  end

  def edit ; end

  def update
    if @post.update_attributes(post_params)
      if @post.errors.full_messages.present?
        flash[:danger] = @post.errors.full_messages.join(", ")
        render :edit
      else
        redirect_to posts_path
      end
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
      params.required(:post).permit(:content,:attachment,:img_reader,:video_reader, pictures_attributes: [:id, :image, :_destroy])
  end

  def set_posts
    if params[:search].to_s == ""
      @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    else
      search = params[:search]
      @posts = Post.select('*').joins(:user).where("posts.content || ' ' || users.full_name ILIKE ?", "%#{search}%").paginate(:page => params[:page], :per_page => 5)
    end
  end

  def search_form
    @search = ""
  end
  
end
