class ParentSquaresController < ApplicationController

  before_action :authenticate_user!

  def index
    @parent_square = ParentSquare.new
    @parent_squares = ParentSquare.all
  end

  def show
    @parent_square = ParentSquare.find(params[:id])
    #子マンダラートを呼び出す
    @child_squares = @parent_square.child_squares
  end



  def create
    @parent_square = ParentSquare.new(parent_square_params)
    @parent_square.user_id = current_user.id
    if @parent_square.save
      8.times do |child_square|
        ChildSquare.create(parent_square_id: @parent_square.id)
      end
      redirect_to parent_square_path(@parent_square.id)
    else
      render 'index'
    end
  end

  def update
    @child_square = ChildSquare.find(params[:id])
    @parent_square = ParentSquare.find(params[:id])
    # row_5_value = params[:row_5]
    # @child_square = ChildSquare.new
     if @parent_square.update(parent_square_params)
    #   @child_square = ChildSquare.create(parent_square_id: @parent_square, position: 1,  row_5: row_5_value)
     redirect_to request.referer
     end
     if @child_square.update(child_square_params)
       redirect_to request.referer
     end
  end

  def destroy
  end

   private

  def parent_square_params
    params.require(:parent_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9)
  end

   def child_square_params
     params.require(:child_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9, :position)
   end


end
