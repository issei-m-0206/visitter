class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @area = Area.all
    # binding.pry
    # @area = Area.find(params[:area_id])
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @areas = Area.all
    @area = Area.new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @area = Area.all
  end
  
  private
  def tweet_params
    params.require(:tweet).permit({ area_ids: [] }, :text, :image).merge(user_id: current_user.id)
  end  

  def set_tweet
    @tweet  = Tweet.find(params[:id])
  end 
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
