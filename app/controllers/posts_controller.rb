class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, success: 'Post has been successfully created'

    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: 'Post has been successfully updated'

    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post has been successfully destroyed'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
