class AddSnToWithdraws < ActiveRecord::Migration[4.2]
  def change
    add_column :withdraws, :sn, :string, after: :id
  end
end
