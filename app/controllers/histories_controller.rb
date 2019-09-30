class HistoriesController < ApplicationController
    
    def index
        @histories= History.all
    end
  
   def new
       
    @history = History.new
  
   end
  
  def create
      @history= History.new(user_id:current_user.id, tabaco_id:current_user.tabaco.id,price:current_user.tabaco.price, volume:current_user.tabaco.volume,
                            brand:current_user.tabaco.brand)
    if @history.save
      redirect_to histories_path,success: "登録しました"
    else
      flash.now[:danger] = "登録できませんでした"
      render :new
    end
  end
  
  def destroy
    @history=History.find_by(user_id:current_user.id, tabaco_id:current_user.tabaco.id,price:current_user.tabaco.price, volume:current_user.tabaco.volume,
                            brand:current_user.tabaco.brand)
    @history.destroy
    
    redirect_to histories_path, success: '購入を取り消しました'
  end
            
  private
  
   def history_params
    params.require(:history).permit(:tabaco_id,:price)
    
    
   end
   
   
  
  
end


