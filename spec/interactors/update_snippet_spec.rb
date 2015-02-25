require 'rails_helper'

describe UpdateSnippet, type: :interactor do
  let(:snippet) { create(:snippet) }

  describe '.call' do
    subject { described_class.call(snippet: snippet, params: snippet_params) }

    context 'with valid snippet params' do
      let(:new_name) { Faker::Lorem.sentence }
      let(:snippet_params) { { name: new_name } }

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'updates the snippet' do
        expect { subject }.to change { snippet.reload.name }.to(new_name)
      end
    end

    context 'with invalid snippet params' do
      let(:snippet_params) do
        {
          pieces_attributes: [
            {
              id: snippet.pieces.first.to_param,
              _destroy: true
            }
          ]
        }
      end

      it 'fails' do
        expect(subject).to be_a_failure
      end
    end
  end
end
