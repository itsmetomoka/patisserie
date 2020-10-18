class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!
	# 商品一覧
	def index
		@products = Product.all
	end

	# 商品新規登録
	def new
		@product = Product.new
	end

	# 商品新規登録
	def create
        @product = Product.new(product_params)
        if @product.save
        	redirect_to admins_product_path(@product)
        else
        	render :new
    	end
	end

	# 商品詳細画面
	def show
		@product = Product.find(params[:id])
	end

	# 商品編集画面
	def edit
		@product = Product.find(params[:id])
	end

	# 商品編集更新
	def update
        product = Product.find(params[:id])
        product.update(product_params)
        redirect_to admins_product_path(product)
	end

	private
	def product_params
	    params.require(:product).permit(:image, :category_id, :name, :introduction, :price, :is_active)
	end
end
