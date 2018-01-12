class RemoveTableInvitations < ActiveRecord::Migration[4.2]
  def change
    drop_table :invitations
  end
end
