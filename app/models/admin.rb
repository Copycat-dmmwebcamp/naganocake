class Admin < ApplicationRecord
  # データベースに登録前に小文字に戻す
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 存在性、フォーマット、一意性の検証
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }
  # 一致しているか、空でない、最小６文字以上
  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  
end
