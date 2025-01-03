class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: "Comentário criado com sucesso!"
    else
      render "posts/show", alert: "Erro ao criar comentário."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
