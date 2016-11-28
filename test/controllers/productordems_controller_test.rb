require 'test_helper'

class ProductordemsControllerTest < ActionController::TestCase
  setup do
    @productordem = productordems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productordems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productordem" do
    assert_difference('Productordem.count') do
      post :create, productordem: { product_id: @productordem.product_id, qtd_product: @productordem.qtd_product, serviceordem_id: @productordem.serviceordem_id, valor_product: @productordem.valor_product }
    end

    assert_redirected_to productordem_path(assigns(:productordem))
  end

  test "should show productordem" do
    get :show, id: @productordem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productordem
    assert_response :success
  end

  test "should update productordem" do
    patch :update, id: @productordem, productordem: { product_id: @productordem.product_id, qtd_product: @productordem.qtd_product, serviceordem_id: @productordem.serviceordem_id, valor_product: @productordem.valor_product }
    assert_redirected_to productordem_path(assigns(:productordem))
  end

  test "should destroy productordem" do
    assert_difference('Productordem.count', -1) do
      delete :destroy, id: @productordem
    end

    assert_redirected_to productordems_path
  end
end
