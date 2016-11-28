class CreateProductordems < ActiveRecord::Migration
  def change
    create_table :productordems do |t|
      t.references :serviceordem, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.decimal :valor_product
      t.integer :qtd_product

      t.timestamps null: false
    end
  end
end
