class AddCountryCodeToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :country_code, :integer
  end
end
