json.extract! client, :id, :nome, :telefone1, :telefone2, :desc_uf, :nome_cidade, :desc_endereco, :nome_bairro, :desc_pontoreferencia, :numr_endereco, :desc_cep, :created_at, :updated_at
json.url client_url(client, format: :json)