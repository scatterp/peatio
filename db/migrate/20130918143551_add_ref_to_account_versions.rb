class AddRefToAccountVersions < ActiveRecord::Migration[4.2]
  def change
    add_column :account_versions, :ref, :string
  end
end
