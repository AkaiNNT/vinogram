class Admins::CommentsController < Admins::BaseController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_action :search_form
  def index
    if params[:search].to_s == ""
      @comments = Comment.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    else
      search = params[:search]
      @comments = Comment.joins(:user).where("comments.content || ' ' || users.full_name || ' ' || comments.id || ' ' || comments.user_id  || ' ' || users.email || ' ' || users.contact_number ILIKE ?", "%#{search}%").paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to admins_comments_path
    else
      flash[:danger] = @comment.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Update successfully'
      redirect_to edit_admins_comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to admins_comments_path
  end

  private

  def search_form
    @search = ""
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
      params.required(:comment).permit(:content , :user_id,  :post_id)
  end
end

