class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy] 

  def create
    @post = current_user.posts.new(post_params)
    if @post.save 
       @post.create_activity key: 'post.created', owner: @post.user 
      respond_to do |format| 
        format.html { redirect_to user_path(@post.user.username), notice: "Post created"}
      end
    else
      redirect_to user_path(@post.user.username), notice: "Failure"
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html {redirect_to user_path(@post.user.username), notice: "Post updated"}
      end
    else
      redirect_to post_path(@post), notice: "sometin went wong"
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@post.user.username), notice: "Post destroyed"}
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


  def set_post
    @post = Post.find(params[:id])
  end

end
