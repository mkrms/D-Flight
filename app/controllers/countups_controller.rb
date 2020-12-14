class CountupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_countup, only:[:show, :edit, :update, :destroy]
  def index
  end

  def new
    @countup = Countup.new
    @gamemode = Gamemode.all
  end

  def show
    @gamemode = Gamemode.find(@countup.gamemode_id)
    @round = Round.new
    @rounds = Round.all
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
