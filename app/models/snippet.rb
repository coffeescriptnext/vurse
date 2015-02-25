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

class Snippet < ActiveRecord::Base
  DEFAULT_NAME_PREFIX = 'snippet'.freeze

  belongs_to :owner, class_name: 'User', required: true

  has_many :pieces, -> { order(:name) }, dependent: :destroy, inverse_of: :snippet

  accepts_nested_attributes_for :pieces, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  validate :validate_minimum_piece_count

  before_validation :set_defaults

  private

  def set_defaults
    persisted? ? identifier = id : identifier = SecureRandom.uuid
    suffix = identifier.gsub(/-/, '').to_i(16).to_s(36)
    self.name = [DEFAULT_NAME_PREFIX, suffix].join('-') if name.blank?
  end

  def validate_minimum_piece_count
    errors.add(:base, 'cannot remove the last piece') if pieces.size < 1 || all_pieces_marked_for_destruction?
  end

  def all_pieces_marked_for_destruction?
    pieces.all?(&:marked_for_destruction?)
  end
end
