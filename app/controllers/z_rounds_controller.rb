class ZRoundsController < ApplicationController
  def create
    @zeroone = Zeroone.find(params[:zeroone_id])
    @z_round = @zeroone.z_rounds.new(z_round_params)
    @z_round.zeroone_id = @zeroone.id
    
    if @z_round.save!
        redirect_back(fallback_location: root_path)
    else
        redirect_back(fallback_location: root_path)
    end
end

def edit
    @zeroone = Zeroone.find(params[:zeroone_id])
    @z_round = ZRound.find(params[:id])
end

def update
    @zeroone = Zeroone.find(params[:zeroone_id])
    @z_round = ZRound.find(params[:id])
    
    
    if @z_round.update!(z_round_params)
        redirect_to zeroone_path(@zeroone.id)
    else
        redirect_back(fallback_location: root_path)
    end
end

private
def z_round_params
    params.require(:z_round).permit(:r_first, :r_second, :r_third, :zeroone_id, :r_sum, :r_ave)
end
end
