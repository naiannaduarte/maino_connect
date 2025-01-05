class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Comentário adicionado com sucesso!" }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("comments_for_#{@post.id}", partial: "comments/comment", locals: { comment: @comment })
        end
      end
    else
      redirect_to posts_path, alert: "Erro ao adicionar o comentário"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
