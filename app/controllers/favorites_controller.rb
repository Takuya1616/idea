class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @favorite = ParentSquare.find(params[:parent_square_id])
    favorite = current_user.favorites.new(parent_square_id: @favorite.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @favorite = ParentSquare.find(params[:parent_square_id])
    favorite = current_user.favorites.find_by(parent_square_id: @favorite.id)
    favorite.destroy
    redirect_to request.referer
  end
end
