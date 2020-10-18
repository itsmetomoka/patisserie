class Customers::SearchesController < ApplicationController

	def search
		@word =params[:word]
		@product = Product.search(@word)
		@categories = Category.all
	end
end
