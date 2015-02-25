# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`admin`**                   | `boolean`          | `default("false"), not null`
# **`confirmation_sent_at`**    | `datetime`         |
# **`confirmation_token`**      | `string`           | `indexed`
# **`confirmed_at`**            | `datetime`         |
# **`created_at`**              | `datetime`         | `not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `inet`             |
# **`email`**                   | `string`           | `default(""), not null, indexed`
# **`encrypted_password`**      | `string`           | `default("")`
# **`failed_attempts`**         | `integer`          | `default("0"), not null`
# **`id`**                      | `uuid`             | `not null, primary key`
# **`invitation_accepted_at`**  | `datetime`         |
# **`invitation_created_at`**   | `datetime`         |
# **`invitation_limit`**        | `integer`          |
# **`invitation_sent_at`**      | `datetime`         |
# **`invitation_token`**        | `string`           | `indexed`
# **`invited_by_id`**           | `uuid`             | `indexed`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `inet`             |
# **`locked_at`**               | `datetime`         |
# **`name`**                    | `string`           | `default("")`
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           | `indexed`
# **`sign_in_count`**           | `integer`          | `default("0"), not null`
# **`unconfirmed_email`**       | `string`           |
# **`unlock_token`**            | `string`           | `indexed`
# **`updated_at`**              | `datetime`         | `not null`
# **`username`**                | `string`           | `default(""), indexed`
#
# ### Indexes
#
# * `users_ix_invited_by_id`:
#     * **`invited_by_id`**
# * `users_uix_confirmation_token` (_unique_):
#     * **`confirmation_token`**
# * `users_uix_email` (_unique_):
#     * **`email`**
# * `users_uix_invitation_token` (_unique_):
#     * **`invitation_token`**
# * `users_uix_reset_password_token` (_unique_):
#     * **`reset_password_token`**
# * `users_uix_unlock_token` (_unique_):
#     * **`unlock_token`**
# * `users_uix_username` (_unique_):
#     * **`username`**
#

class User < ActiveRecord::Base
  devise :confirmable, :database_authenticatable, :invitable, :lockable, :recoverable, :registerable, :rememberable, :trackable

  has_many :snippets, foreign_key: :owner_id, dependent: :destroy, inverse_of: :owner

  attr_accessor :login

  validates :email, email: true, presence: true
  validates :username, format: { with: /\A[a-z][a-z0-9_\-]*\z/i }, uniqueness: { case_sensitive: false }, presence: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)

    if login.present?
      where(conditions).where(['lower(username) = :login OR lower(email) = :login', { login: login.downcase }]).first if login
    else
      where(conditions).first
    end
  end

  def send_reset_password_instructions
    super if invitation_token.nil?
  end
end
