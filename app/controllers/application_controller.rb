class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

#退会済みユーザーがログインできなくする
before_action :reject_user, only: [:create]




protected

  def after_sign_in_path_for(resource)
     if end_user_signed_in?
    	 root_path
     else 
       admins_homes_top_path
     end

  end


  def after_sign_out_path_for(resource)
    if  resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

#退会済みユーザーがログインできなくする
  def reject_user
    @end_user = EndUser.find_by(email: params[:end_user][:email].downcase)
    if @end_user
      if (@end_user.valid_password?(params[:end_user][:password]) && (@end_user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to  new_end_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
end
