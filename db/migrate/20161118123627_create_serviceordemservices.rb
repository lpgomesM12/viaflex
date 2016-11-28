class CreateServiceordemservices < ActiveRecord::Migration
  def change
    create_table :serviceordemservices do |t|
      t.references :serviceordem, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.decimal :valor_service
      t.integer :qtd_service

      t.timestamps null: false
    end
  end
end
