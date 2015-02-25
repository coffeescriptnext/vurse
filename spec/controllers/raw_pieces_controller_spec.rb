require 'rails_helper'
require 'support/shared_contexts/authentication'

describe RawPiecesController, type: :controller do
  include_context 'authenticated user'

  let(:snippet) { create(:snippet) }
  let(:piece) { snippet.pieces.first }

  describe 'GET #index' do
    it 'renders the first piece body as plain text' do
      get :index, username: snippet.owner.username, snippet_id: snippet.to_param
      expect(response.body).to eql(piece.body)
    end

    it 'scopes the snippet lookup to the current user if username is the same' do
      snippet = create(:snippet, owner: current_user)
      piece = snippet.pieces.first
      get :index, username: current_user.username, snippet_id: snippet.to_param
      expect(response.body).to eql(piece.body)
    end
  end

  describe 'GET #show' do
    it 'renders the piece body as plain text' do
      get :show, username: snippet.owner.username, snippet_id: snippet.to_param, piece_id: piece.to_param
      expect(response.body).to eql(piece.body)
    end

    it 'scopes the snippet lookup to the current user if username is the same' do
      snippet = create(:snippet, owner: current_user)
      piece = snippet.pieces.first
      get :index, username: current_user.username, snippet_id: snippet.to_param
      expect(response.body).to eql(piece.body)
    end
  end
end
