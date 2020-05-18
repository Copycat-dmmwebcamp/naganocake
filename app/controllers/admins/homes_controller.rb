class Admins::HomesController < ApplicationController
  # このコントローラが動作する前に実行、admin側でログイン認証できていなければadmin側のログイン画面へ
  before_action :authenticate_admin!

  def top
  	@orders = Order.all
  end
end
