class AddDisabledToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :disabled, :boolean, default: false
  end
end
