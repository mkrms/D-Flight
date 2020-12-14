class RoundsController < ApplicationController
    def create
        @countup = Countup.find(params[:countup_id])
        @round = @countup.rounds.new(round_params)
        if @round.save!
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def round_params
        params.require(:round).permit(:r_first, :r_second, :r_third, :countup_id)
    end
end
