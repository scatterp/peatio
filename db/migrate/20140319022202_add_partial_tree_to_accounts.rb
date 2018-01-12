class AddPartialTreeToAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :partial_tree, :text
  end
end
