class RatingsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(rating_params)
    @rating.user = current_user
    @rating.save
    redirect_to product_path(@product)
  end

  private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end
end
