class Admin < ApplicationRecord
  # データベースに登録前に小文字に戻す
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # emailに＠が入っているか、一意性の検証
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }
  # 確認用と一致しているか、空でない、最小６文字以上
  validates :password, confirmation: true, length: { minimum: 6 }

  # 追加、admin側でもend_userの情報編集ができるため
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
  validates :user_status, inclusion: { in: [:true, :false] }
  
end
