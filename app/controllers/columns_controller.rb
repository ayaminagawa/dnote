class ColumnsController < ApplicationController

  def index
    @column = Column.find(:last) 
  end

  def show
    @id = params[:id]
    @column = Column.find(@id)
  end

  def new
  	@column = Column.new
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      redirect_to(about_index_path)
    else
      render 'new'
    end
    
  end

  def destroy
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def column_params
      params.require(:column).permit(:title, :body, :nutritionist_id, :permission)
    end
  end
