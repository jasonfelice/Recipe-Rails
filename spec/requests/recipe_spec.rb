require 'rails_helper'

RSpec.describe 'Public view', type: :request do
  before(:example) { get '/' }

  it 'should have response ok' do
    expect(response).to have_http_status(302)
  end
end
