class UsersController < ApplicationController
  
  def index
  end

  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.order("created_at DESC").page(params[:page]).per(5)
    @relationship = Relationship.all
  end

  def mypage
    user = User.all
  end  

  def gmap
  end 

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def follow_index
    @users = User.find(params[:id])
    user = User.find(params[:id])
  end  

end
