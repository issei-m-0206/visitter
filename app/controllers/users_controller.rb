class UsersController < ApplicationController
  
  def index
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.order("created_at DESC").page(params[:page]).per(5)
  end

  def mypage
  end  

  def gmap
  end  
end
