class PostsController < ApplicationController

  before_action :validate_post_author, only: [:edit, :update]

  def create
    # subpost = Sub.find(params[:sub_id])
    @post = current_user.posts.new(post_params)
    # @post.user_id = current_user.id
    if @post.save
      redirect_to sub_url(params[:sub_id])
      # @post.in_subs.each do |in_sub|
      #   in_sub.post_id = @post.id
      #   in_sub.save
      # end
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(params[:sub_id])
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @all_comments = @post.comments.includes(:user)
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

  private
  
  def validate_post_author
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless @post.user_id = current_user.id
  end

  def post_params
    params[:post].permit(:title, :url, :content, :user_id, sub_ids: [])
  end
end
