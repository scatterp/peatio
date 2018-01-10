class ChangeRefToTextInAccountVersions < ActiveRecord::Migration[4.2]
  def change
    change_column :account_versions, :ref, :text
  end
end
