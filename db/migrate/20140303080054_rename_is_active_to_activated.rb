class RenameIsActiveToActivated < ActiveRecord::Migration[4.2]
  def change
    change_table :two_factors do |t|
      t.rename :is_active, :activated
    end
  end
end
