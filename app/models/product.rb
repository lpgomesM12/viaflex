class Product < ActiveRecord::Base

  def self.search(term)
    where("lower(nome_produto)like ?", "%#{term.downcase}%")
  end

end
