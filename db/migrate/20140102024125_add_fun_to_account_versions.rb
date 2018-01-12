class AddFunToAccountVersions < ActiveRecord::Migration[4.2]
  def change
    add_column :account_versions, :fun, :integer
  end
end
