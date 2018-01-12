class AddAccountIdIndexOnAccountVersions < ActiveRecord::Migration[4.2]
  def change
    add_index :account_versions, :account_id
  end
end
