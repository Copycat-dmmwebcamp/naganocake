class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   has_many :orders, dependent: :destroy
   has_many :cart_items, dependent: :destroy
   has_many :delivery_places, dependent: :destroy

# 漢字のフルネーム
  def full_name_kanji
    self.family_name_kanji+   self.first_name_kanji
  end

#退会済みユーザーがログインできなくする
   def active_for_authentication?
    super && (self.user_status == true)
   end
end
