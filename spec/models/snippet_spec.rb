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

require 'rails_helper'

describe Snippet, type: :model do
  describe 'setting default values' do
    context 'when persisted and name is blank' do
      it 'sets name to the default name prefix and the base32 snippet ID' do
        snippet = create(:snippet)
        allow(snippet).to receive(:id).and_return('12345abcde')
        snippet.name = nil
        snippet.validate
        expect(snippet.name).to eql("#{Snippet::DEFAULT_NAME_PREFIX}-zx2zbvi")
      end
    end

    context 'when not persisted and name is blank' do
      before do
        allow(SecureRandom).to receive(:uuid).and_return('abcde12345')
      end

      it 'sets name to the default name prefix and a random base32 ID' do
        snippet = build(:snippet)
        snippet.validate
        expect(snippet.name).to eql("#{Snippet::DEFAULT_NAME_PREFIX}-9ezeqdz9")
      end
    end

    context 'when name is not blank' do
      it 'does not modify name' do
        snippet = build(:snippet, name: 'snippet-name')
        snippet.validate
        expect(snippet.name).to eql('snippet-name')
      end
    end
  end
end
