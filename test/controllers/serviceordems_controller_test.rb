require 'test_helper'

class ServiceordemsControllerTest < ActionController::TestCase
  setup do
    @serviceordem = serviceordems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serviceordems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serviceordem" do
    assert_difference('Serviceordem.count') do
      post :create, serviceordem: { client_id: @serviceordem.client_id, data_instalacao: @serviceordem.data_instalacao, data_venda: @serviceordem.data_venda, desc_formapagamento: @serviceordem.desc_formapagamento, desc_produto: @serviceordem.desc_produto, nome_tecnicoatendimento: @serviceordem.nome_tecnicoatendimento, tele_parente1: @serviceordem.tele_parente1, tele_parente2: @serviceordem.tele_parente2 }
    end

    assert_redirected_to serviceordem_path(assigns(:serviceordem))
  end

  test "should show serviceordem" do
    get :show, id: @serviceordem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serviceordem
    assert_response :success
  end

  test "should update serviceordem" do
    patch :update, id: @serviceordem, serviceordem: { client_id: @serviceordem.client_id, data_instalacao: @serviceordem.data_instalacao, data_venda: @serviceordem.data_venda, desc_formapagamento: @serviceordem.desc_formapagamento, desc_produto: @serviceordem.desc_produto, nome_tecnicoatendimento: @serviceordem.nome_tecnicoatendimento, tele_parente1: @serviceordem.tele_parente1, tele_parente2: @serviceordem.tele_parente2 }
    assert_redirected_to serviceordem_path(assigns(:serviceordem))
  end

  test "should destroy serviceordem" do
    assert_difference('Serviceordem.count', -1) do
      delete :destroy, id: @serviceordem
    end

    assert_redirected_to serviceordems_path
  end
end
