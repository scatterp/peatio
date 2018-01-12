class FundSourcesIsLockedDefaultToFalse < ActiveRecord::Migration[4.2]
  def change
    change_column_default :fund_sources, :is_locked, false
  end
end
