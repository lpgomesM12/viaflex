require 'test_helper'

class ServiceordemservicesControllerTest < ActionController::TestCase
  setup do
    @serviceordemservice = serviceordemservices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serviceordemservices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serviceordemservice" do
    assert_difference('Serviceordemservice.count') do
      post :create, serviceordemservice: { qtd_service: @serviceordemservice.qtd_service, service_id: @serviceordemservice.service_id, serviceordem_id: @serviceordemservice.serviceordem_id, valor_service: @serviceordemservice.valor_service }
    end

    assert_redirected_to serviceordemservice_path(assigns(:serviceordemservice))
  end

  test "should show serviceordemservice" do
    get :show, id: @serviceordemservice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serviceordemservice
    assert_response :success
  end

  test "should update serviceordemservice" do
    patch :update, id: @serviceordemservice, serviceordemservice: { qtd_service: @serviceordemservice.qtd_service, service_id: @serviceordemservice.service_id, serviceordem_id: @serviceordemservice.serviceordem_id, valor_service: @serviceordemservice.valor_service }
    assert_redirected_to serviceordemservice_path(assigns(:serviceordemservice))
  end

  test "should destroy serviceordemservice" do
    assert_difference('Serviceordemservice.count', -1) do
      delete :destroy, id: @serviceordemservice
    end

    assert_redirected_to serviceordemservices_path
  end
end
