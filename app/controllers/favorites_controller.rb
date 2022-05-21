class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @parent_square = ParentSquare.find(params[:parent_square_id])
    favorite = current_user.favorites.new(parent_square_id: @parent_square.id)
    favorite.save
  end

  def destroy
    @parent_square = ParentSquare.find(params[:parent_square_id])
    favorite = current_user.favorites.find_by(parent_square_id: @parent_square.id)
    favorite.destroy
  end
end
