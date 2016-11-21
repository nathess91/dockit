class PostsController < ApplicationController

  def index
    render :json => Post.all
  end

  def show
    render :json => post = Post.find(params[:id])
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
