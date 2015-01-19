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

require 'rails_helper'

describe User, type: :model do
  describe '.find_first_by_auth_conditions' do
    let!(:user) { create(:confirmed_user, username: 'username', email: 'email@example.com') }

    it 'finds by email' do
      expected = described_class.find_first_by_auth_conditions(login: 'email@example.com')
      expect(expected).to eql(user)
    end

    it 'ignores case for email' do
      expected = described_class.find_first_by_auth_conditions(login: 'eMaIl@eXaMpLe.cOm')
      expect(expected).to eql(user)
    end

    it 'finds by username' do
      expected = described_class.find_first_by_auth_conditions(login: 'username')
      expect(expected).to eql(user)
    end

    it 'ignores case for username' do
      expected = described_class.find_first_by_auth_conditions(login: 'uSeRnAmE')
      expect(expected).to eql(user)
    end

    it 'returns nil for no match' do
      expected = described_class.find_first_by_auth_conditions(login: 'nonexistent')
      expect(expected).to be_nil
    end

    it 'finds by invitation token' do
      token = user.send(:generate_invitation_token)
      user.save(validate: false)
      expected = described_class.find_first_by_auth_conditions(invitation_token: token)
      expect(expected).to eql(user)
    end

    it 'finds by reset password token' do
      original_token = user.send(:set_reset_password_token)
      token = Devise.token_generator.digest(described_class, :reset_password_token, original_token)
      expected = described_class.find_first_by_auth_conditions(reset_password_token: token)
      expect(expected).to eql(user)
    end

    it 'finds by unlock token' do
      _original_token, token = Devise.token_generator.generate(described_class, :unlock_token)
      user.unlock_token = token
      user.save(validate: false)
      expected = described_class.find_first_by_auth_conditions(unlock_token: token)
      expect(expected).to eql(user)
    end
  end

  describe '#send_reset_password_instructions' do
    it 'does not send anything if the user is pending an invitation' do
      user = build(:user, invitation_token: 'an invitation token')
      expect(user).not_to receive(:send_devise_notification).with(:reset_password_instructions, anything)
      user.send_reset_password_instructions
    end

    it 'delivers the reset instructions if the user is active' do
      user = build(:confirmed_user)
      expect(user).to receive(:send_devise_notification).with(:reset_password_instructions, anything, {})
      user.send_reset_password_instructions
    end
  end
end
