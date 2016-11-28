json.extract! service, :id, :nome_servico, :descricao, :created_at, :updated_at
json.url service_url(service, format: :json)