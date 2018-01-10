class ChangeWithdraws < ActiveRecord::Migration[4.2]
  def change
    rename_column :withdraws, :withdraw_channel_id, :channel_id
    rename_column :withdraws, :tx_id, :txid
    rename_column :withdraws, :fund_source_uid, :fund_uid
    rename_column :withdraws, :fund_source_extra, :fund_extra
  end
end
