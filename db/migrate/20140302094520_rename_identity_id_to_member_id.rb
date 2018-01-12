class RenameIdentityIdToMemberId < ActiveRecord::Migration[4.2]
  def change
    change_table :tokens do |t|
      t.rename :identity_id, :member_id
    end

    change_table :two_factors do |t|
      t.rename :identity_id, :member_id
    end
  end
end
