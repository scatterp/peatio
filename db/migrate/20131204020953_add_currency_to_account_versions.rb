class AddCurrencyToAccountVersions < ActiveRecord::Migration[4.2]
  def up
    add_column :account_versions, :currency, :integer
    remove_column :account_versions, :detail
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
