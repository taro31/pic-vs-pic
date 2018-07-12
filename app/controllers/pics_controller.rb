class PicsController < ApplicationController
    
  def index
    @pics = Pic.all
  end
  
  def new
    @pic = Pic.new
  end
  
  def create
    Pic.create(pic_params)
  end
  
  private
  def pic_params
    params.require(:pic).permit(:name, :image)
  end
end
