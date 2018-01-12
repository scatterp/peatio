class RemovePinDigestFromIdentities < ActiveRecord::Migration[4.2]
  def up
    remove_column :identities, :pin_digest
  end

  def down
    add_column :identities, :pin_digest, :string
  end
end
