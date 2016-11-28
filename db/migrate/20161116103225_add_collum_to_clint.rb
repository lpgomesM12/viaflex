class AddCollumToClint < ActiveRecord::Migration
  def change
    add_column :clients, :situacao, :string
    add_column :clients, :observacao, :string
  end
end
