require 'rails_helper'
require 'ostruct'

describe ApplicationHelper, type: :helper do
  describe '#sort_label_for' do
    it 'returns the label for the sort key and direction' do
      sort_labels = { key_direction: 'Key/Direction' }
      stub_const('ApplicationHelper::SORT_LABELS', sort_labels)
      expect(helper.sort_label_for('key', 'direction')).to eql('Key/Direction')
    end
  end

  describe '#friendly_timestamp' do
    context 'when the record updated_at is the same as created_at' do
      it 'returns a time tag for created_at' do
        time = Time.now
        record = OpenStruct.new(created_at: time, updated_at: time)
        expect(helper.friendly_timestamp(record)).to include(helper.time_ago_in_words(time))
      end
    end

    context 'when the record updated_at is not the same as created_at' do
      it 'returns time tag for updated_at' do
        created_at = 3.days.ago
        updated_at = Time.now
        record = OpenStruct.new(created_at: created_at, updated_at: updated_at)
        expect(helper.friendly_timestamp(record)).to include(helper.time_ago_in_words(updated_at))
      end
    end
  end

  describe '#render_markdown' do
    let(:text) do
      <<-EOS
Hello, World!

<script>This will be sanitized</script>
      EOS
    end

    it 'renders Markdown as HTML' do
      expect(helper.render_markdown(text)).to include('<p>Hello, World!</p>')
    end

    it 'sanitizes HTML output' do
      expect(helper.render_markdown(text)).not_to include('This will be sanitized')
    end
  end

  describe '#render_sanitized' do
    let(:text) { '<script>This will be sanitized</script>' }

    it 'sanitizes HTML output' do
      expect(helper.render_sanitized(text)).not_to include('This will be sanitized')
    end
  end
end
