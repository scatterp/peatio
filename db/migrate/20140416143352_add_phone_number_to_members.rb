class AddPhoneNumberToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :phone_number, :string
  end
end
