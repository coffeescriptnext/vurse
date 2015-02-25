require 'rails_helper'

describe CreateSnippet, type: :interactor do
  let(:user) { create(:user) }

  describe '.call' do
    subject { described_class.call(user: user, params: snippet_params) }

    context 'with valid snippet params' do
      let(:snippet_params) do
        attributes_for(:snippet).merge(
          pieces_attributes: [
            attributes_for(:piece).except(:snippet_id)
          ]
        )
      end

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'creates the snippet' do
        expect { subject }.to change { user.snippets.count }.by(1)
      end

      it 'adds the snippet to the context' do
        expect(subject.snippet).to be_a(Snippet)
      end
    end

    context 'with invalid snippet pieces' do
      let(:snippet_params) do
        attributes_for(:snippet).merge(
          pieces_attributes: [
            attributes_for(:piece).except(:snippet_id, :body)
          ]
        )
      end

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'does not create the snippet' do
        expect { subject }.to change { user.snippets.count }.by(0)
      end

      it 'adds the snippet to the context' do
        expect(subject.snippet).to be_a(Snippet)
      end
    end

    context 'with no snippet pieces' do
      let(:snippet_params) do
        attributes_for(:snippet).merge(pieces_attributes: [])
      end

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'does not create the snippet' do
        expect { subject }.to change { user.snippets.count }.by(0)
      end

      it 'adds a blank piece to the snippet' do
        expect(subject.snippet.pieces.size).to eql(1)
      end
    end
  end
end
