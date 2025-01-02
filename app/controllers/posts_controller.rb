class PostsController < ApplicationController
  def index
    @posts = Post.all  # Recupera todos os posts
  end
end
