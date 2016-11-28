class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :nome_servico
      t.string :descricao

      t.timestamps null: false
    end
  end
end
