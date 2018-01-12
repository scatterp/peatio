class AddTypeToDeposits < ActiveRecord::Migration[4.2]
  def change
    add_column :deposits, :type, :string
  end
end
