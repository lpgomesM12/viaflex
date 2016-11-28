class Client < ActiveRecord::Base
  validates :nome, presence: true
  #validates_presence_of :nome, message: 'Testando'

  def self.search(term)
    where("lower(nome)like ?", "%#{term.downcase}%")
  end

  SITUACAO = %w[Ótimo Bom Ruim]


  def self.busca(term)
    result = term =~ /[[:digit:]]/
    term = term.downcase
    if result == 0
        where("lower(cpf)like ?", "%#{term}%")
    else
      where("lower(nome)like ?", "%#{term}%")
    end
  end


end
