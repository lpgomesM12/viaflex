class Client < ActiveRecord::Base
  validates :nome, presence: true
  #validates_presence_of :nome, message: 'Testando'

  def self.search(term)
    where("lower(nome)like ?", "%#{term.downcase}%")
  end

end
