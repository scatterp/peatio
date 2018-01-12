class AddFeeToAccountVersions < ActiveRecord::Migration[4.2]
  def change
    add_column :account_versions, :fee, :decimal, precision: 32, scale: 16, after: :locked
  end
end
