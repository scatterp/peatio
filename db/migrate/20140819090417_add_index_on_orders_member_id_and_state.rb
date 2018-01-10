class AddIndexOnOrdersMemberIdAndState < ActiveRecord::Migration[4.2]
  def change
    add_index :orders, [:member_id, :state]
  end
end
