class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to post_path(@post), notice: "Comentário publicado com sucesso!"
    else
      redirect_to post_path(@post), alert: "Erro ao publicar comentário: " + @comment.errors.full_messages.to_sentence
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post não encontrado."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
