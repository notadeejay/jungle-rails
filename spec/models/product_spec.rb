require 'rails_helper'

RSpec.describe Product, type: :model do
 
  describe 'Validations' do
      
    describe 'Product.save' do
      it 'Should should save' do
        @category = Category.new( name: 'Test Category' )
        @product = Product.new(
          name: 'Test product',
          price: 150,
          quantity: 2,
          category: @category)
        expect(@product.save).to be true
      end

      it 'Name should be present' do
        @category = Category.new( name: 'Test Category' )
        @product = Product.create(
          name: nil,
          price: 150,
          quantity: 2,
          category: @category)
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'Price should be present' do
        @category = Category.new( name: 'Test Category' )
        @product = Product.create(
          name: 'Test Product',
          price: nil,
          quantity: 2,
          category: @category)
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'Quantity should be present' do
        @category = Category.new( name: 'Test Category' )
        @product = Product.create(
          name: "Test Product",
          price: 150,
          quantity: nil,
          category: @category)
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'Category should be present' do
        @product = Product.create(
          name: nil,
          price: 150,
          quantity: 2,
          category: nil)
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

    end
  end
end