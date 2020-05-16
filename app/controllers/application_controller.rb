class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?





protected

  def after_sign_in_path_for(resource)
    end_users_items_path
  end

  
  def after_sign_out_path_for(resource)
    end_users_items_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
end
