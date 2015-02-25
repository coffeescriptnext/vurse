require 'rails_helper'
require 'support/shared_contexts/authentication'

describe SnippetsController, type: :controller do
  describe 'GET #index' do
    include_context 'authenticated user'

    subject { get :index }

    it 'assigns snippets' do
      expect { subject }.to change { assigns(:snippets) }.from(nil)
    end
  end

  describe 'GET #new' do
    context 'when signed in' do
      include_context 'authenticated user'

      before do
        get :new
      end

      it 'assigns a new snippet' do
        expect(assigns(:snippet)).to be_a(Snippet)
        expect(assigns(:snippet).pieces.first).to be_a(Piece)
      end

      it 'renders the new snippet page' do
        expect(response).to render_template('snippets/new')
      end
    end

    context 'when signed out' do
      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    include_context 'authenticated user'

    subject { post :create, username: current_user.username, snippet: { some: { snippet: :params } } }

    before do
      expect(CreateSnippet).to receive(:call).once.with(hash_including(user: current_user)).and_return(context)
    end

    context 'when successful' do
      let(:context) { double(:context, success?: true, snippet: snippet) }
      let(:snippet) { create(:snippet, owner: current_user) }

      it 'redirects to the snippet' do
        expect(subject).to redirect_to(snippet_path(current_user, snippet))
      end
    end

    context 'when unsuccessful' do
      let(:context) { double(:context, success?: false, snippet: snippet) }
      let(:snippet) { build(:snippet) }

      it 'assigns the snippet' do
        expect { subject }.to change { assigns(:snippet) }.to(snippet)
      end

      it 'renders the new snippet form' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    include_context 'authenticated user'

    subject { patch :update, username: current_user.username, id: snippet.to_param, snippet: { some: { snippet: :params } } }

    let(:snippet) { create(:snippet, owner: current_user) }

    before do
      expect(UpdateSnippet).to receive(:call).once.with(hash_including(snippet: snippet)).and_return(context)
    end

    context 'when successful' do
      let(:context) { double(:context, success?: true, snippet: snippet) }

      it 'redirects to the snippet' do
        expect(subject).to redirect_to(snippet_path(current_user, snippet))
      end
    end

    context 'when unsuccessful' do
      let(:context) { double(:context, success?: false, snippet: snippet) }

      it 'assigns the snippet' do
        expect { subject }.to change { assigns(:snippet) }.to(snippet)
      end

      it 'renders the edit snippet form' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    include_context 'authenticated user'

    subject { delete :destroy, username: current_user.username, id: snippet.to_param }

    let!(:snippet) { create(:snippet, owner: current_user) }

    it 'destroys the snippet' do
      expect { subject }.to change { current_user.snippets.size }.by(-1)
    end

    it 'redirects to the current user profile' do
      expect(subject).to redirect_to(profile_path(current_user.username))
    end
  end
end
