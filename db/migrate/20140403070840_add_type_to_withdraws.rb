class AddTypeToWithdraws < ActiveRecord::Migration[4.2]
  def up
    add_column :withdraws, :type, :string

    Withdraw.all.each do |withdraw|
      type = withdraw.currency == 'btc' ? 'Withdraws::Satoshi' : 'Withdraws::Bank'
      withdraw.update_column :type, type
    end
  end

  def down
    remove_column :withdraws, :type
  end
end
