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

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name(nil, %w(-_)) }
    name { Faker::Name.name }
    password 'secret123'
    password_confirmation 'secret123'
    created_at { Faker::Date.backward }

    factory :confirmed_user do
      after :build do |user|
        user.skip_confirmation!
        user.confirmed_at = user.created_at + 5.minutes
      end

      factory :admin_user do
        admin true
      end
    end

    factory :invited_user do
      name nil
      username nil
      password nil
      password_confirmation nil

      to_create do |user|
        User.invite!(user.attributes)
      end

      after :build do |user|
        user.skip_confirmation!
      end

      after :create do |user|
        user.invite!
      end
    end
  end
end
