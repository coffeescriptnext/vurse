# ## Schema Information
#
# Table name: `snippets`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`created_at`**   | `datetime`         | `not null`
# **`description`**  | `text`             |
# **`id`**           | `uuid`             | `not null, primary key`
# **`name`**         | `string`           | `not null`
# **`owner_id`**     | `uuid`             | `not null, indexed`
# **`updated_at`**   | `datetime`         | `not null`
#
# ### Indexes
#
# * `snippets_ix_owner_id`:
#     * **`owner_id`**
#

FactoryGirl.define do
  factory :snippet do
    owner factory: :confirmed_user
    created_at { Faker::Date.backward }
    updated_at { created_at }

    after :build do |snippet|
      snippet.pieces.build(body: Faker::Lorem.paragraphs(5).join("\n\n"))
    end

    trait :with_description do
      description { Faker::Lorem.paragraphs(rand(3)).join("\n\n") }
    end

    trait :with_pieces do
      after :create do |snippet|
        create_list :piece, rand(5), snippet: snippet
      end
    end
  end
end
