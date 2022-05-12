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
      ParentSquare.create(user_id: current_user.id, row_5: <paramer>)#アイデア入力後にセーブしたら同時にクリエイトする
      redirect_to square_path(@square.id)
    else
      render 'index'
    end
  end
  
  def update
    @parent_suqare.update(row_〇)
    @child_suqare.create(parent_square_id: @parent_suquare, position:〇,  row_5: <>)
    
    redirect_to @child_square
  end

  def show
    @square = Square.find(params[:id])
    if params[:row_1] != nil then
      @row_1 = params[:row_1]
    else
      @row_1 = 'アイデアを入力して下さい'
    end

  end

  def edit
  end

  def update
     @square = Square.find(params[:id])
     if @square.update(square_params)
      ManagementSquare.create(user_id: current_user.id, square_id: @square.id, parent_square_id: 0)
      redirect_to square_path(@square.id)
     end

  end

  def destroy
  end

  private

  def square_params
    params.require(:square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9)
  end

end
