class DeleteTableAccountVersions < ActiveRecord::Migration[4.2]
  def up
    drop_table :account_versions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
