class FollowersController < ApplicationController

  def new
    @follower = Follower.new
  end

  def create
    @follower = Follower.new(follower_params)
    if @follower.save
      flash[:notice] = "Your details has been saved on the system. Thank you for following me! #{@follower.name}."
    else
      redirect_to new_follower_path
      flash[:alert] = "Your details didn't get saved! Please make sure that your name and email are valid."
    end
  end

  def destroy
    @follower = Follower.where(token: params[:id]).first
    if @follower.destroy
    else
      flash[:alert] = "Something went wrong! Please try again."
    end
  end

  private

  def follower_params
    params.require(:follower).permit(:name, :email)
  end
end
