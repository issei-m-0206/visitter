class AreasController < ApplicationController
  def new
    @area = Area.new
  end
  
  def create
  end

  def part
    @area = Area.find(params[:id])
    area = Area.find(params[:id])
    @tweets = area.tweets.order("created_at DESC").page(params[:page]).per(5)
  end  
end
