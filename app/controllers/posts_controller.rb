class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.admin?
      @post = current_user.posts.create(post_params)
      if @post.valid? && current_user.admin?
        redirect_to '/bulletins'
      else
        flash[:error] = @post.errors.full_messages.join(". ")
        redirect_to :back
      end
    else
      flash[:notice] = "You are not authorized to create a post"
      redirect_to :back
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to '/bulletins'
    else
      flash[:error] = @post.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post deleted successfully"
      redirect_to '/bulletins'
    else
      flash[:error] = @post.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_read, :user_id, :post_id)
  end

end
