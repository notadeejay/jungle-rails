class CategoriesController < ApplicationController
  before_filter :authorize
  
  def index
    @category = Category.all
  end
  
  def new
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
