class RemoveChannelId < ActiveRecord::Migration[4.2]
  def change
    remove_column :deposits, :channel_id
    remove_column :payment_transactions, :channel_id
  end
end
