require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def index
    @posts = Post.all  # Isso busca todos os posts do banco de dados
  end
end
