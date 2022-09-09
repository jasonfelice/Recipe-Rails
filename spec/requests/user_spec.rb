require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/user/index'
      expect(response).to have_http_status(302)
    end
  end
end
