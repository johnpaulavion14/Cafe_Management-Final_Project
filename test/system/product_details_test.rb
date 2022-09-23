require "application_system_test_case"

class ProductDetailsTest < ApplicationSystemTestCase
  setup do
    @product_detail = product_details(:one)
  end

  test "visiting the index" do
    visit product_details_url
    assert_selector "h1", text: "Product details"
  end

  test "should create product detail" do
    visit product_details_url
    click_on "New product detail"

    fill_in "Image", with: @product_detail.image
    fill_in "Price", with: @product_detail.price
    fill_in "Product name", with: @product_detail.product_name
    click_on "Create Product detail"

    assert_text "Product detail was successfully created"
    click_on "Back"
  end

  test "should update Product detail" do
    visit product_detail_url(@product_detail)
    click_on "Edit this product detail", match: :first

    fill_in "Image", with: @product_detail.image
    fill_in "Price", with: @product_detail.price
    fill_in "Product name", with: @product_detail.product_name
    click_on "Update Product detail"

    assert_text "Product detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Product detail" do
    visit product_detail_url(@product_detail)
    click_on "Destroy this product detail", match: :first

    assert_text "Product detail was successfully destroyed"
  end
end
