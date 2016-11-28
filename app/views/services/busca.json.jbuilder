json.array!(@services) do |result|
json.id result.id
json.value result.nome_servico
end
