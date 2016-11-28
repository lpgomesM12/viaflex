class AddcolumToServiceordem < ActiveRecord::Migration
  def change
      add_column :serviceordems, :situacao, :string
      add_column :serviceordems, :turno, :string
      add_column :serviceordems, :horainicio, :string
      add_column :serviceordems, :horafim, :string
  end
end
