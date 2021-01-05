class RoundsController < ApplicationController
    def create
        @countup = Countup.find(params[:countup_id])
        @round = @countup.rounds.new(round_params)
        @round.countup_id = @countup.id

        if @round.save!
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        @countup = Countup.find(params[:countup_id])
        @round = Round.find(params[:id])
    end

    def update
        @countup = Countup.find(params[:countup_id])
        @round = Round.find(params[:id])
        
        
        if @round.update!(round_params)
            redirect_to countup_path(@countup.id)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def round_params
        params.require(:round).permit(:r_first, :r_second, :r_third, :countup_id, :r_sum, :r_ave)
    end
end
