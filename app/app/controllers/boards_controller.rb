class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  
  def show
    @board= Board.find(params[:id])
  end

  def new
    @board = Board.new
    @board.board_details.build
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      flash[:notice] = '投稿が完了しました' 
      redirect_to user_path(@board.user_id)
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def update
  end

  def destroy
  end


  private

    def board_params
      params.require(:board).permit(:title,:image,:reason,:preparation,:onepoint, tag_ids: [],board_details_attributes: [:id, :body, :image_detail, :_destroy])
    end

end
