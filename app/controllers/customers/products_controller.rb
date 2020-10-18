class Customers::ProductsController < ApplicationController

	def top
		@categories = Category.all
		@products = Product.all
	end

	def index
		@categories = Category.only_active
		if params[:category_id]
			@category = Category.find(params[:category_id])
			all_products = @category.products
		else
			all_products = Product.all
		end
		@products_count = all_products.count
		@products = all_products.page(params[:page]).per(4)
	end

	def show
		@product = Product.find(params[:id])
		@categories = Category.all
		@cart_product = CartProduct.new
	end

	def about
	end
end


