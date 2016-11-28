class Serviceordem < ActiveRecord::Base
  belongs_to :client
  has_many :fotoordemservice
  has_many :productordem, dependent: :destroy
  has_many :serviceordemservice, dependent: :destroy

  has_many :fotoordemservice, dependent: :destroy
  accepts_nested_attributes_for :fotoordemservice, allow_destroy: true, :reject_if => lambda { |t| t['foto'].nil? }

  validates_presence_of :client_id, message: 'Você deve pesquisar por um cliente', :on => :update

  FORMAPAGEMENTO = %w[Dinheiro Cartão Boleto Cheque]
  TURNO = %w[Matutino Vespertino Noturno]
  SITUACAO = %w[Orçamento Andamento Reagendado Cancelado Realizado]

  def self.busca(term)
    result = term =~ /[[:digit:]]/
      sql = " INNER JOIN clients cl on serviceordems.client_id = cl.id"
    if result == 0
        sql = sql + " WHERE lower(cl.cpf) like '%#{term.downcase}%'"
    else
      sql = sql + " WHERE lower(cl.nome) like '%#{term.downcase}%'"
    end
    self.joins(sql)
  end

end
