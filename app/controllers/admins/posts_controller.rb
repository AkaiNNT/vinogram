class Admins::PostsController < Admins::BaseController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :search_form
  def index
    if params[:search].to_s == ""
      @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    else
      search = params[:search]
      @posts = Post.where("content || ' ' || user_id || ' ' || id ILIKE ?", "%#{search}%").paginate(:page => params[:page], :per_page => 5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admins_posts_path
    else
      flash[:danger] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    if params[:post][:pictures_attributes].to_s != "" && !destroy_all_pic?
      @post.attachment.destroy
      if @post.update(post_edit_params)
        flash[:notice] = 'Update successfully'
        redirect_to edit_admins_post_path(@post)
      else
        flash[:danger] = @post.errors.full_messages.join(", ")
        render :edit
      end
    elsif params[:post][:attachment].to_s != "" && destroy_all_pic?
      @post.pictures.delete_all
      @post.attachment = params[:post][:attachment]
      @post.content = params[:post][:content]
      if @post.save
        flash[:notice] = 'Update successfully'
        redirect_to edit_admins_post_path(@post)
      else
        flash[:danger] = @post.errors.full_messages.join(", ")
        render :edit
      end
    elsif params[:post][:pictures_attributes].to_s == "" && params[:post][:attachment].to_s == "" && !destroy_all_pic?
      @post.content = params[:post][:content]
      if @post.save
        flash[:notice] = 'Update successfully'
        redirect_to edit_admins_post_path(@post)
      else
        flash[:danger] = @post.errors.full_messages.join(", ")
        render :edit
      end
    else
      flash[:danger] = 'Post must has at least one picture or one video.'
      render :edit
    end
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

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
      params.required(:post).permit(:content , :user_id,  :attachment, pictures_attributes: [ :id, :image, :_destroy])
  end

  def post_edit_params
      params.required(:post).permit(:content ,:attachment, pictures_attributes: [ :id, :image, :_destroy])
  end

  def destroy_all_pic?
    if !params[:post][:pictures_attributes].nil?
      h = params[:post][:pictures_attributes]
      ah = []
      ap = []
      d = []
      d_all = true
      h.values.each do |vh|
        ah.push(vh)
      end
      ah.each do |t|
        if t.count > 1
          ap.push(t)
        end
      end
      ap.each do |c|
        c.each do |z|
          d.push(z[1])
        end
      end
      d.each do |p|
        if p.to_s === 'false'
          d_all = false
        end
      end
      return d_all
    end
  end
end

