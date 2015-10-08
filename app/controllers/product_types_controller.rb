class ProductTypesController < ApplicationController
  def index
    @product_types = ProductType.all
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.create(product_type_params)
    if @product_type.save
      flash[:info] = 'Product type created!'
      redirect_to product_types_path
    else
      flash[:danger] = @product_type.errors.errors.full_messages.join("<br/>")
      redirect_to product_types_path
    end
  end

  def update
    @product_type = ProductType.find(params[:id])
    if @product_type.update_attributes(product_type_params)
      flash[:info] = 'Product type saved!'
      redirect_to product_types_path
    else
      flash[:danger] = @product_type.errors.full_messages.join("<br/>")
      redirect_to product_types_path
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    if @product_type.destroy
      flash[:info] = 'Product type deleted!'
      redirect_to product_types_path
    else
      flash[:danger] = @product_type.errors.full_messages.join("<br/>")
      redirect_to product_types_path
    end
  end

  private
  def product_type_params
    params.require(:product_type).permit(:title)
  end
end
