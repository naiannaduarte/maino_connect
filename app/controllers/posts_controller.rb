class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
    @posts = Post.all
  end
end
