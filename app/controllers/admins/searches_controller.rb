class Admins::SearchesController < ApplicationController



	def search
		@keyword = params[:keyword]
		@searched_end_users = EndUser.search(params[:keyword])
		@searched_items = Item.search(params[:keyword])
	end
end
