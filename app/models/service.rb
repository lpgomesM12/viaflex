class Service < ActiveRecord::Base

  def self.search(term)
    where("lower(nome_servico)like ?", "%#{term.downcase}%")
  end

end
