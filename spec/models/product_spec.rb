require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @category = Category.new name: 'test category'
      @product = Product.new name: 'test product', price: 99, quantity: '88', category: @category
      # price and quantity (integer) can be either string or number, but with diff errors messages

      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

    it "is not valid without an valid name" do
      @category = Category.new name: 'test category'
      @product = Product.new name: '', price: '99', quantity: '88', category: @category

      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid without an valid price" do
      @category = Category.new name: 'test category'
      @product = Product.new name: 'test product', price: '', quantity: '88', category: @category

      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid without an valid quantity" do
      @category = Category.new name: 'test category'
      @product = Product.new name: 'test product', price: 99, quantity: '', category: @category

      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid without an valid category" do
      @product = Product.new name: 'test product', price: 99, quantity: '88', category: nil
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

  end

end
