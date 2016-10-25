class CreateServiceordems < ActiveRecord::Migration
  def change
    create_table :serviceordems do |t|
      t.text :desc_produto
      t.string :nome_tecnicoatendimento
      t.datetime :data_venda
      t.datetime :data_instalacao
      t.string :desc_formapagamento
      t.string :tele_parente1
      t.string :tele_parente2
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
