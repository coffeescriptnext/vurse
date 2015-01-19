require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:confirmed_user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'allows login with email' do
      post :create, user: { login: user.email, password: 'secret123' }
      expect(response).to redirect_to(root_path)
    end

    it 'allows login with username' do
      post :create, user: { login: user.username, password: 'secret123' }
      expect(response).to redirect_to(root_path)
    end
  end
end
