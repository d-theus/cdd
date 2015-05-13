class PostsController < ApplicationController
  before_action :fetch_post,  only: [:edit, :show, :update, :destroy]
  before_action :create_post, only: [:new]
  before_action :authenticate, except: [:show, :index]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def search
    @posts = Post
    .find_by_sql(['SELECT * FROM posts WHERE title LIKE ? ORDER BY created_at DESC', "%#{params[:query]}%"])
  end

  def show
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Succesfully created'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Error occured. Post has not been saved.'
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:notice] = 'Succesfully updated'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Error occured. Post has not been saved.'
      render 'edit'
    end
  end

  def destroy
    if @post.delete
      flash[:notice] = 'Post succesfully deleted'
      redirect_to posts_path
    else
      flash[:alert] = 'Something went wrong. Post is still there'
      render 'edit'
    end
  end

  private

  def fetch_post
    @post = Post.find(params[:id])
  end

  def create_post
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authenticate
    if signed_in?
      true
    else
      redirect_to new_admin_session_path
    end
  end
end
