class ChangeToEnumerizeInTrades < ActiveRecord::Migration
  def up
    change_column :trades, :trend, "integer USING trend::integer"
    change_column :trades, :currency, "integer USING currency::integer"
  end

  def down
    change_column :trades, :currency, :string
    change_column :trades, :trend, :boolean
  end
end
