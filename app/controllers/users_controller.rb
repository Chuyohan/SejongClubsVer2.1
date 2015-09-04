class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "회원가입 완료! 다시 로그인 해주세요."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def following
    @club  = current_user.club.build
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
