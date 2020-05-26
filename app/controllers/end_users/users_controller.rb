class EndUsers::UsersController < ApplicationController
  def index
  	@users = EndUser.all
  end

  def edit
	@user = EndUser.find(params[:id])
  end

  def update
	@user = EndUser.find(params[:id])
   if params[:end_user][:user_status] == "false" #退会用の記述
     @user.user_status = false
     @user.update(user_params)
     reset_session #ログアウト
     redirect_to root_path
   else
	   if @user.update(user_params) #会員登録情報の編集用記述
	      redirect_to new_end_users_user_path(@user.id)
     else #エラーメッセージ表示用
      render 'edit'
    end
   end
  end

  def leave
    @user = EndUser.find(params[:id])
  end

  private

   def user_params
     params.require(:end_user).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :user_status)
   end


end
