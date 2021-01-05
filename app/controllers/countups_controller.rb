class CountupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_countup, only:[:show, :edit, :update, :destroy]
  def index
    @countups = current_user.countups.all
    @countups.each do |countup|
      countup.score = countup.rounds.pluck(:r_sum).compact.sum
      countup.ave = countup.score / 8
      countup.save!
    end
  end

  def new
    @countup = Countup.new
    @gamemode = Gamemode.all
  end

  def show
    @round = Round.new
    @rounds = Round.all.where(countup_id: @countup.id)
    
    @rounds.each do |round|
      array = []
      array << round.r_first.to_i
      array << round.r_second.to_i
      array << round.r_third.to_i
      
      round.r_sum = array.sum 
      round.r_ave = array.sum / array.length
      round.save!
    end
    
    if @countup.rounds.count > 0
    @countup.score = @countup.rounds.pluck(:r_sum).compact.sum
    @countup.ave = @countup.rounds.pluck(:r_ave).compact.sum / @countup.rounds.pluck(:r_ave).compact.length
    end
  end

  def edit
  end

  def create
    @countup = Countup.new(countup_params)
    @countup.user_id = current_user.id
    if @countup.save!
      redirect_to countup_path(@countup.id)
    else
      render 'new'
    end
  end

  def update
    if @countup.update!()
      redirect_to countup_path(@countup.id)
    else
      render 'edit'
    end
  end

  def destroy
  end
  private

  def countup_params
    params.require(:countup).permit(:gamemode_id)
  end

  def find_countup
    @countup = Countup.find(params[:id])
  end
end
