class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments

    if @comment.save
      flash[:success] = 'Comment has been successfully created'
      @comment = @post.comments.build
    end
    # puts @comment.errors.inspect
    render 'posts/show', object: [@comment, @comments]
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment has been successfully destroyed'
    @comment = @post.comments.build
    @comments = @post.comments
    render 'posts/show', object: @comments
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment, :post_id)
  end
end
