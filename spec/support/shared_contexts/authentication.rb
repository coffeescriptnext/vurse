shared_context 'authenticated user' do
  let(:current_user) { create(:confirmed_user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(current_user)
  end
end
