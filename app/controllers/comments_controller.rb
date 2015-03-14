class CommentsController < ApplicationController

  def new

  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(params[:post_id])
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(params[:post_id])
    end
  end

  def comment_params
    params[:comment].permit(:content, :user_id, :post_id, :parent_comment_id)
  end

  def show
    @comment = Comment.find(params[:id])
    @comments_by_parent_id=Post.find(@comment.post_id).comments_by_parent_id
  end
end
