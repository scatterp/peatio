class AddTypeToTwoFactors < ActiveRecord::Migration[4.2]
  def change
    add_column :two_factors, :type, :string
  end
end
