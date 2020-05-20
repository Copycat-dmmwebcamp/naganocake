class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   has_many :orders, dependent: :destroy
   has_many :cart_items, dependent: :destroy
   has_many :delivery_places, dependent: :destroy

  # メール、存在性、フォーマット、一意性の検証
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }
  # 確認用と一致しているか、６文字以上
  validates :encrypted_password, confirmation: true, length: { minimum: 6 }
  # ファミリーネームは空白でなければOK
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  # 全角カタカナ表記
  validates :family_name_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  # 郵便番号7桁のみ
  validates :postal_code, length: { is: 7 }
  validates :address, presence: true
  # 電話ハイフンなし10か11桁
  validates :phone_number, length: { in: 10..11 }
  # validates :user_status, inclusion: { in: [:true, :false] }はadmin側で使用する


# 漢字のフルネーム
  def full_name_kanji
    self.family_name_kanji+   self.first_name_kanji
  end

#退会済みユーザーがログインできなくする
   def active_for_authentication?
    super && (self.user_status == true)
   end
end
