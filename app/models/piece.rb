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

class Piece < ActiveRecord::Base
  DEFAULT_NAME_PREFIX = 'piece'.freeze

  belongs_to :snippet, required: true, inverse_of: :pieces, touch: true

  validates :body, :name, presence: true

  before_validation :set_defaults

  private

  def set_defaults
    persisted? ? identifier = id : identifier = SecureRandom.uuid
    suffix = identifier.gsub(/-/, '').to_i(16).to_s(36)
    self.name = [DEFAULT_NAME_PREFIX, suffix].join('-') if name.blank?
  end
end
