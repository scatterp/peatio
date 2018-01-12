class AddActivatedToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :activated, :boolean
  end
end
