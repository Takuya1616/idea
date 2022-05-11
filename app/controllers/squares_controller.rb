class SquaresController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def index
    @square = Square.new
  end

  def create
    @square = Square.new(square_params)
    if @square.save
      ManagementSquare.create(user_id: current_user.id, square_id: @square.id, parent_square_id: 0)
    end
    redirect_to square_path(@square.id)
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def square_params
    params.require(:square).permit(:row_5)
  end

end
