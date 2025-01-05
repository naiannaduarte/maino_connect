class UsersController < ApplicationController
  before_action :set_user, only: [ :destroy ]

  def destroy
    @user.comments.destroy_all  # Remove todos os comentários antes de excluir o usuário
    @user.destroy
    redirect_to root_path, notice: "Usuário excluído com sucesso!"
  rescue ActiveRecord::RecordNotDestroyed
    redirect_to users_path, alert: "Existem comentários associados a este usuário. Remova-os antes de excluir o usuário."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
