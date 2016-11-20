class PostsController < ApplicationController

  before_filter :authorize_admin_manager, only: :create

  def index
    render :json => Post.all, status: 200
  end

  def create
    post = User.find(params[:user_id]).posts.new(post_params)

    post.user_id = current_user.id
    post.save
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
