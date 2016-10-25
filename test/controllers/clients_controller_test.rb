require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { desc_cep: @client.desc_cep, desc_endereco: @client.desc_endereco, desc_pontoreferencia: @client.desc_pontoreferencia, desc_uf: @client.desc_uf, nome: @client.nome, nome_bairro: @client.nome_bairro, nome_cidade: @client.nome_cidade, numr_endereco: @client.numr_endereco, telefone1: @client.telefone1, telefone2: @client.telefone2 }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { desc_cep: @client.desc_cep, desc_endereco: @client.desc_endereco, desc_pontoreferencia: @client.desc_pontoreferencia, desc_uf: @client.desc_uf, nome: @client.nome, nome_bairro: @client.nome_bairro, nome_cidade: @client.nome_cidade, numr_endereco: @client.numr_endereco, telefone1: @client.telefone1, telefone2: @client.telefone2 }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
