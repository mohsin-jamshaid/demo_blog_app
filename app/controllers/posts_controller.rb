class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]

  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def show; end

  def destroy; end

  private

  def find_project
    @post = Post.find(params[:id])
  end
end
