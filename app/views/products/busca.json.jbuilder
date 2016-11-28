json.array!(@products) do |result|
json.id result.id
json.value result.nome_produto
end
