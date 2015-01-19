require 'rails_helper'

describe SnippetsController, type: :controller do
  describe 'GET #new' do
    context 'when signed in' do
      let(:current_user) { create(:confirmed_user) }

      before do
        sign_in current_user
      end

      it 'renders the new snippet page' do
        get :new
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
end
