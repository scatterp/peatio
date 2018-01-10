class RemovePhoneNumberVerifiedFromMembers < ActiveRecord::Migration[4.2]
  def change
    remove_column :members, :phone_number_verified
  end
end
