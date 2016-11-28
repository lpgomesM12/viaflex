class AddCollum1ToClint < ActiveRecord::Migration
  def change
    add_column :clients, :cpf, :string
    add_column :clients, :rg, :string
  end
end
