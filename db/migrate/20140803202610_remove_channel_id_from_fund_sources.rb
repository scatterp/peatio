class RemoveChannelIdFromFundSources < ActiveRecord::Migration[4.2]
  def change
    remove_column :fund_sources, :channel_id
  end
end
