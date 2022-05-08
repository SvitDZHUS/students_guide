# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shelves', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  after do
    logout(user)
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get shelf_url(user.shelf)
      expect(response).to render_template(:show)
    end
  end
end
