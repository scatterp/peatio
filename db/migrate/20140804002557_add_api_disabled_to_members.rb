class AddAPIDisabledToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :api_disabled, :boolean, default: false
  end
end
