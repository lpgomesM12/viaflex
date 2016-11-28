json.extract! product, :id, :nome_produto, :descricao, :created_at, :updated_at
json.url product_url(product, format: :json)