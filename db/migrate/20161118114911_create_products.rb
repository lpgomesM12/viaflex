class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nome_produto
      t.string :descricao

      t.timestamps null: false
    end
  end
end
