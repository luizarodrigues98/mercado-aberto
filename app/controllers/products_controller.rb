class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: [:index, :new, :create]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @category ? @category.products : Product.all
  end

  def show
    ViewLog.create(user: current_user, product: @product, viewed_at: Time.now, ip_address: request.remote_ip)
    cookies[:viewed_products] ||= []
    cookies[:viewed_products] = (cookies[:viewed_products] << @product.id.to_s)
  end

  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.build(product_params)
    @product.user = current_user
    if @product.save
      redirect_to category_product_path(@category, @product), notice: 'Produto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to category_product_path(@product.category, @product), notice: 'Produto atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to category_products_path(@product.category), notice: 'Produto removido com sucesso.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_quantity, :image_url, :category_id)
  end
end