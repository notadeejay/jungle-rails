class RatingsController < ApplicationController
before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(rating_params)
    @rating.user = current_user
    @rating.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.find(params[:id])
    @rating.destroy
    redirect_to product_path(@product)
  end


  private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end
end
