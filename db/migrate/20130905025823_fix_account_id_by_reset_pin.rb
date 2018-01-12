class FixAccountIdByResetPin < ActiveRecord::Migration[4.2]
  def change
    rename_column :reset_pins, :account_id, :member_id
  end
end
