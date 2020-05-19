class Admins::OrderHistoriesController < ApplicationController

  # このコントローラが動作する前に実行、admin側でログイン認証できていなければadmin側のログイン画面へ
  before_action :authenticate_admin!

  def index
  	@orders = Order.all
  end

  def show
  end

  def update_order
  end

  def update_product
  end
end
