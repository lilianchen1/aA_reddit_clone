class SubsController < ApplicationController

  before_action :validate_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def sub_params
    params[:sub].permit(:title, :description, :user_id)
  end

  def validate_moderator
    subpost = Sub.find(params[:id])
    redirect_to sub_url(subpost) unless subpost.user_id == current_user.id
  end

end
