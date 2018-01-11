class CreateIdentities < ActiveRecord::Migration[4.2]
  def change
    create_table :identities do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_active, default: true
      t.integer :retry_count, default: 0
      t.boolean :is_locked, default: false
      t.datetime :locked_at
      t.datetime :last_verify_at
      t.timestamps
    end
    add_index :identities, :email, unique: true

    create_table :two_factors do |t|
      t.integer :identity_id
      t.string :otp_secret
      t.datetime :last_verify_at
    end
  end
end
