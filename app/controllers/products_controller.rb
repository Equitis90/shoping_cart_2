class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    @product_types = ProductType.all.map{|p_t| [p_t.title, p_t.id] }
  end

  def index
    @products = Product.where(:active => true)
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
    @product_types = ProductType.all.map{|p_t| [p_t.title, p_t.id] }
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:info] = 'Product ceated!'
      redirect_to all_products_path
    else
      flash[:danger] = @product.errors.full_messages.join("<br/>")
      redirect_to all_products_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:info] = 'Product saved!'
      redirect_to all_products_path
    else
      flash[:danger] = @product_type.errors.full_messages.join("<br/>")
      redirect_to all_products_path
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:info] = 'Product deleted!'
      redirect_to all_products_path
    else
      flash[:danger] = @product.errors.full_messages.join("<br/>")
      redirect_to all_products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :active, :product_type_id)
  end
end
