class ProductsController < ApplicationController

  def index
    @product = Product.all
    render json: @product
  end

  def create
    @product = Product.create(product_params)
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product: params[:product])
    render json: @product
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      # head :no_content, status: :ok
      render json: Product.all, status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  private
  def product_params
    p params
    params.require(:product).permit(:name, :category)
  end

end
