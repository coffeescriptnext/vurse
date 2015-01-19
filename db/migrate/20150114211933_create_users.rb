class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      # Account information
      t.string :name, default: ''
      t.string :email, default: '', null: false
      t.string :username, default: ''
      t.boolean :admin, default: false, null: false

      # Password authentication
      t.string :encrypted_password, default: ''
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Email confirmation
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      # Invitation
      t.string :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer :invitation_limit
      t.references :invited_by, type: :uuid

      # Account locking
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token
      t.datetime :locked_at

      # Authentication tracking
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      # Timestamps
      t.timestamps null: false
    end

    add_index :users, :email, unique: true, name: :users_uix_email
    add_index :users, :username, unique: true, name: :users_uix_username
    add_index :users, :confirmation_token, unique: true, name: :users_uix_confirmation_token
    add_index :users, :reset_password_token, unique: true, name: :users_uix_reset_password_token
    add_index :users, :unlock_token, unique: true, name: :users_uix_unlock_token
    add_index :users, :invitation_token, unique: true, name: :users_uix_invitation_token
    add_index :users, :invited_by_id, name: :users_ix_invited_by_id
  end
end
