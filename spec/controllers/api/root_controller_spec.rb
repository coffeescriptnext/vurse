require 'rails_helper'

describe API::RootController, type: :controller do
  describe 'GET #index' do
    it 'returns an empty JSON object' do
      get :index, format: :json

      expect(response.body).to be_json_eql('{}')
    end
  end
end
