class ZeroonesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_zeroone, only:[:show, :edit, :update, :destroy]
    def index
        @zeroones = current_user.zeroones.all
        @zeroones.each do |zeroone|
        zeroone.remain = 701 - zeroone.z_rounds.pluck(:r_sum).compact.sum
        #zeroone.ave = zeroone.score / 8
        zeroone.save!
        end
    end
    
    def new
        @zeroone = Zeroone.new
        @gamemode = Gamemode.all
    end
    
    def show
        @z_round = ZRound.new
        @z_rounds = ZRound.all.where(zeroone_id: @zeroone.id)
        
        @z_rounds.each do |round|
        array = []
        array << round.r_first.to_i
        array << round.r_second.to_i
        array << round.r_third.to_i

        round.r_sum = array.sum 
        round.r_ave = array.sum / array.length 
        round.save!
        end

        if @zeroone.z_rounds.count > 0
        @zeroone.remain = 701 - @zeroone.z_rounds.pluck(:r_sum).compact.sum
        #@zeroone.ave = @zeroone.z_rounds.pluck(:r_ave).compact.sum / @zeroone.z_rounds.pluck(:r_ave).compact.length
        end
    end
    
    def edit
    end
    
    def create
        @zeroone = Zeroone.new(zeroone_params)
        @zeroone.user_id = current_user.id
        if @zeroone.save!
        redirect_to zeroone_path(@zeroone.id)
        else
        render 'new'
        end
    end
    
    def update
        if @zeroone.update!()
        redirect_to zeroone_path(@zeroone.id)
        else
        render 'edit'
        end
    end
    
    def destroy
    end
    private
    
    def zeroone_params
        params.require(:zeroone).permit(:gamemode_id)
    end
    
    def find_zeroone
        @zeroone = Zeroone.find(params[:id])
    end
    
end
