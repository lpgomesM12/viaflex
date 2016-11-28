class AddCollumToServiceordem < ActiveRecord::Migration
  def change
    add_column :serviceordems, :dias_validadeproposta, :integer
    add_column :serviceordems, :dias_prazoentrega, :integer
  end
end
