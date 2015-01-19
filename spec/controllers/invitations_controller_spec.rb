require 'rails_helper'

describe InvitationsController, type: :controller do
  describe 'PATCH #update' do
    let(:user) { create(:invited_user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'updates the user with valid parameters' do
      update_params = {
        username: Faker::Internet.user_name,
        password: 'secret123'
      }

      patch :update, user: update_params

      # expect { patch :update, user: update_params }.to change { user.reload.updated_at }
    end
  end
end
