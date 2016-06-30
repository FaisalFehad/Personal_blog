class FollowersController < ApplicationController

  def new
    @follower = Follower.new
  end

  def create
    @follower = Follower.new(follower_params)
    @follower.save
  end

  private

  def follower_params
    params.require(:follower).permit(:name, :email)
  end
end
