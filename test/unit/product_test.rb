require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end
  test "price must not be negative" do
    product = Product.new(title: 'Titleus', description: 'some description')
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0",
    product.errors[:price].join('; ')
    product.price = 1
    assert product.valid?
    product.price = 0
    assert product.valid?
  end
end
