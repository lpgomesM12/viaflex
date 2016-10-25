class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :telefone1
      t.string :telefone2
      t.string :desc_uf
      t.string :nome_cidade
      t.string :desc_endereco
      t.string :nome_bairro
      t.string :desc_pontoreferencia
      t.string :numr_endereco
      t.string :desc_cep

      t.timestamps null: false
    end
  end
end
