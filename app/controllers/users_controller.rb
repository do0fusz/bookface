class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  before_action :authenticate_user!, only: [:index]
  
  def index
    case params[:people] 
      when "friends"
        @users = current_user.active_friends
      when "requests"
        @users = current_user.pending_friends_requests_from.map(&:friend)
      when "pending"
        @users = current_user.pending_friends_requests_to.map(&:user)
      else
        @users = User.where.not(id: current_user.id)
      end
  end
  
  def show
    @post = Post.new 
    @posts = current_user.posts.order('created_at DESC')
    @activities = PublicActivity::Activity.where(owner_id: @user.id).order('created_at DESC')
  end

  private
  def set_user
    @user = User.find_by(username: params[:id])
  end
end
