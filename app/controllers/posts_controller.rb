class PostsController < ApplicationController

  before_filter :authorize_admin_manager, only: :create

  def index
    render :json => Post.all, status: 200
  end

  def show
    post = Post.find(params[:id])
  end

  def create
    post = User.find(params[:user_id]).posts.new(post_params)

    if post.valid? && post.user_id = current_user.id
      post.save
      render :json => post, status: 201
    else
      render :json => {error: "Post validation failed"}, status: 400
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
