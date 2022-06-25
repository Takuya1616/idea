class ParentSquaresController < ApplicationController

  before_action :authenticate_user!

  def index
    @parent_square = ParentSquare.new
    @parent_squares = current_user.parent_squares.order('created_at DESC')
    @parent_squares = current_user.parent_squares.page(params[:page]).per(10).order('updated_at DESC')
  end

  def show
    @parent_square = ParentSquare.find(params[:id])
    #子マンダラートを呼び出す
    @child_squares = @parent_square.child_squares
    if @parent_square.user == current_user
        render "show"
    else
        redirect_to parent_squares_path
    end
  end



  def create
    @parent_square = ParentSquare.new(parent_square_params)
    @parent_square.user_id = current_user.id
    @parent_square.score = Language.get_data(parent_square_params[:row_5])
    if @parent_square.save
      8.times do |child_square|
        ChildSquare.create(parent_square_id: @parent_square.id)
      end
      redirect_to parent_square_path(@parent_square.id)
    else
      @parent_squares = current_user.parent_squares.page(params[:page]).per(10).order('updated_at DESC')
      render 'index'
    end
  end

  def update
    @parent_square = ParentSquare.find(params[:id])
    # row_5_value = params[:row_5]
    # @child_square = ChildSquare.new
     if @parent_square.update(parent_square_params)
        parent_square_rows = ParentSquare.select('row_1, row_2, row_3, row_4, row_6, row_7, row_8, row_9').find(params[:id]).attributes.values
        @parent_square.child_squares.each_with_index do |child_square, index|
          child_square.update(row_5: parent_square_rows[index])
          flash.now[:notice] = 'セーブしました'
        end
     end
  end

  def destroy
    @parent_square = ParentSquare.find(params[:id])
    if @parent_square.destroy == current_user
      @parent_square.destroy
    else
      redirect_to request.referer
    end
  end

   private

  def parent_square_params
    params.require(:parent_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9,
    child_squares_attributes: [:row_1, :row_2, :row_3, :row_4, :row_6, :row_7, :row_8, :row_9, :position, :_destroy, :id]
    )
  end

  def child_square_params
    params.require(:child_square).permit(:row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_7, :row_8, :row_9, :position)
  end

end
