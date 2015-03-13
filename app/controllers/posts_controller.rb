class PostsController < ApplicationController

  before_action :validate_post_author, only: [:edit, :update]

  def create
    subpost = Sub.find(params[:sub_id])
    @post = subpost.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub_id)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def validate_post_author
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless @post.user_id = current_user.id
  end

  def post_params
    params[:post].permit(:title, :url, :content, :sub_id, :user_id)
  end
end
