require "pry"

class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
      end
    end
  end
end