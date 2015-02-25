# ## Schema Information
#
# Table name: `pieces`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`body`**        | `text`             | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`id`**          | `uuid`             | `not null, primary key`
# **`name`**        | `string`           | `not null`
# **`snippet_id`**  | `uuid`             | `not null, indexed`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `pieces_ix_snippet_id`:
#     * **`snippet_id`**
#

FactoryGirl.define do
  factory :piece do
    association :snippet, strategy: :build
    body { Faker::Lorem.paragraphs(5).join("\n\n") }
  end
end
