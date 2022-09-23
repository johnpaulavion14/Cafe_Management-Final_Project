require "test_helper"

class ProductDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_detail = product_details(:one)
  end

  test "should get index" do
    get product_details_url
    assert_response :success
  end

  test "should get new" do
    get new_product_detail_url
    assert_response :success
  end

  test "should create product_detail" do
    assert_difference("ProductDetail.count") do
      post product_details_url, params: { product_detail: { image: @product_detail.image, price: @product_detail.price, product_name: @product_detail.product_name } }
    end

    assert_redirected_to product_detail_url(ProductDetail.last)
  end

  test "should show product_detail" do
    get product_detail_url(@product_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_detail_url(@product_detail)
    assert_response :success
  end

  test "should update product_detail" do
    patch product_detail_url(@product_detail), params: { product_detail: { image: @product_detail.image, price: @product_detail.price, product_name: @product_detail.product_name } }
    assert_redirected_to product_detail_url(@product_detail)
  end

  test "should destroy product_detail" do
    assert_difference("ProductDetail.count", -1) do
      delete product_detail_url(@product_detail)
    end

    assert_redirected_to product_details_url
  end
end
