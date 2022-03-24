# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WelcomePages', type: :request do
  describe 'GET /welcome' do
    it 'returns http success' do
      get '/welcome_pages/welcome'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /news' do
    it 'returns http success' do
      get '/welcome_pages/news'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /contacts' do
    it 'returns http success' do
      get '/welcome_pages/contacts'
      expect(response).to have_http_status(:success)
    end
  end
end
