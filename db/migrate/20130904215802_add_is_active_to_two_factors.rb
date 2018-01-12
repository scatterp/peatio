class AddIsActiveToTwoFactors < ActiveRecord::Migration[4.2]
  def change
    add_column :two_factors, :is_active, :boolean
  end
end
