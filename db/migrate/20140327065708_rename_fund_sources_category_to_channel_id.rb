class RenameFundSourcesCategoryToChannelId < ActiveRecord::Migration[4.2]
  def change
    rename_column :fund_sources, :category, :channel_id
  end
end
