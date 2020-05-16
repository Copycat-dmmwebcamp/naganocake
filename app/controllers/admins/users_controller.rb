class Admins::UsersController < ApplicationController


    def index
     @users = EndUser.all
    end

	def show
	 @user = EndUser.find(params[:id])
	end

	def edit
	 @user = EndUser.find(params[:id])
	end

	def update
	 @user = EndUser.find(params[:id])
	 @user.update(user_params)
	 redirect_to admins_user_path(@user.id)
	end

    private

    def user_params
     params.require(:end_user).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :user_status)
    end
end
