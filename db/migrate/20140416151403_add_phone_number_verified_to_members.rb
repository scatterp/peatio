class AddPhoneNumberVerifiedToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :phone_number_verified, :boolean
  end
end
