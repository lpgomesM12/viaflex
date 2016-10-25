class Serviceordem < ActiveRecord::Base
  belongs_to :client

  validates_presence_of :client_id, message: 'Você deve pesquisar por um cliente'

  FORMAPAGEMENTO = %w[Dinheiro Cartão Boleto]

end
