class RemoveFundSourcesAccountId < ActiveRecord::Migration[4.2]
  def change
    remove_column :fund_sources, :account_id
  end
end
