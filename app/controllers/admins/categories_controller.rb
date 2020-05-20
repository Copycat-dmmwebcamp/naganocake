class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

	def index
		@categories = Category.all
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
		   redirect_to admins_categories_path
		else
		  @categories = Category.all
		  render 'index'
		end
	end

	def edit
		# idもってくる
		@category = Category.find(params[:id])

	end


	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
		   redirect_to admins_categories_path
		else
		   render 'edit'
		end
	end

	private
	# category_paramsのparams定義付け
		def category_params
    	    params.require(:category).permit(:name, :category_status)
    	end

end