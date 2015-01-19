require 'rails_helper'

describe RegistrationsController, type: :controller do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    # Just to test allowed parameters.
    it 'creates a new user account' do
      create_params = { email: 'new-user@example.com', username: 'new-username', password: 'secret123' }
      post :create, user: create_params
      expect(User.first.attributes).to include(create_params.except(:password).stringify_keys)
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:confirmed_user) }

    before do
      sign_in(user)
    end

    it 'redirects to the edit account page' do
      patch :update, id: user.to_param, user: { current_password: 'secret123' }
      expect(response).to redirect_to(edit_user_registration_path)
    end

    # Just to test allowed parameters.
    it 'updates account attributes' do
      update_params = { name: 'New Name', username: 'new-username', current_password: 'secret123' }
      patch :update, id: user.to_param, user: update_params
      expect(user.reload.attributes).to include('name' => 'New Name', 'username' => 'new-username')
    end
  end
end
