class RenameAccountLogsToAccountVersions < ActiveRecord::Migration[4.2]
  def change
    rename_table :account_logs, :account_versions
  end
end
