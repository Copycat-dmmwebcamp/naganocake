class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

#退会済みユーザーがログインできなくする
before_action :reject_user, only: [:create]




protected

  def after_sign_in_path_for(resource)
     if end_user_signed_in?
    	 end_users_items_path
     else 
       admins_homes_top_path
     end

  end


  def after_sign_out_path_for(resource)
    end_users_items_path
  end

#退会済みユーザーがログインできなくする
  def reject_user
   if end_user_signed_in?
    if current_end_user.user_status == false
       sign_out
       redirect_to new_end_user_session_path
    end
   end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
end
