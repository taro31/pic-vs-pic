class PicsController < ApplicationController
    
  def index
    @pics = Pic.last(2)
  end
  
  def new
    @pic = Pic.new
  end
  
  def create
    @pic = Pic.create(pic_params)
    
    pic = Pic.last
    pic.text =  GoogleCloudVision.new.request
    pic.save
    redirect_to action: :index 

  end
  
  private
  def pic_params
    params.require(:pic).permit(:name, :image)
  end

end