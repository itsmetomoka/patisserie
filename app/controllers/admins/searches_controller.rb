class Admins::SearchesController < ApplicationController

	def search
		@word = params[:word]

		@customer = Customer.search(@word)
		@product = Product.search(@word)
	end
end
