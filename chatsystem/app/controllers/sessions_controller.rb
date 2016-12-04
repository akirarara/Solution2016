class SessionsController < ApplicationController
  def new # ログインフォーム
  end

def create # ログイン処理
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      render 'new'
    end
  end
    
  def destroy # ログアウト
    sign_out
    redirect_to root_url
  end
end
