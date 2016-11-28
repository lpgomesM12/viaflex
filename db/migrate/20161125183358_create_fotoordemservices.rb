class CreateFotoordemservices < ActiveRecord::Migration
  def change
    create_table :fotoordemservices do |t|
      t.references :serviceordem, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
