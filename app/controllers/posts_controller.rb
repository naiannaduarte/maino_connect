class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @posts = Post.includes(:comments).order(created_at: :desc).page(params[:page]).per(3)
    @paginator = @posts
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post não encontrado."
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post não encontrado."
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post atualizado com sucesso!"
    else
      render :edit
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post não encontrado."
  end

  def excluir
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post excluído com sucesso!"
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post não encontrado."
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
