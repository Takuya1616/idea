class ChildSquareController < ApplicationController

  before_action :authenticate_user!
  def show
    @child_square = ChildSquare.find(params[:id])
  end

  def create
  end

  def update
    @child_square = ChildSquare.find(params[:id])
    if @child_square.update(child_square_params)
       redirect_to request.referer
    end
  end

   private

  def child_square_params
    params.require(:child_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9, :position)
  end

  def parent_square_params
    params.require(:parent_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9,
    child_squares_attributes: [:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9, :position, :_destroy]
    )
  end

end
