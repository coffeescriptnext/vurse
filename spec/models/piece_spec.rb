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

require 'rails_helper'

describe Piece, type: :model do
  describe 'setting default values' do
    context 'when persisted and name is blank' do
      it 'sets name to the default name prefix and the base32 piece ID' do
        piece = create(:piece)
        allow(piece).to receive(:id).and_return('12345abcde')
        piece.name = nil
        piece.validate
        expect(piece.name).to eql("#{Piece::DEFAULT_NAME_PREFIX}-zx2zbvi")
      end
    end

    context 'when not persisted and name is blank' do
      before do
        allow(SecureRandom).to receive(:uuid).and_return('abcde12345')
      end

      it 'sets name to the default name prefix and a random base32 ID' do
        piece = build(:piece)
        piece.validate
        expect(piece.name).to eql("#{Piece::DEFAULT_NAME_PREFIX}-9ezeqdz9")
      end
    end

    context 'when name is not blank' do
      it 'does not modify name' do
        piece = build(:piece, name: 'piece-name')
        piece.validate
        expect(piece.name).to eql('piece-name')
      end
    end
  end
end
