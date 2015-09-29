class MusicController < ApplicationController
  def index
    @music = Music.all
    @musics = Music.search(params[:search])
  end
  def show
    @music = Music.find(params[:id])
  end
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  def likes 
    current_user.like(Music.find(params[:id]))
  end
  def dislikes 
    current_user.dislike(Music.find(params[:id]))
  end
end
