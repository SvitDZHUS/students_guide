# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LineItems', type: :request do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  before do
    sign_in(user)
  end

  after do
    logout(user)
  end

  describe 'POST /add_item_to_cart' do
    it 'adds an item to cart' do
      expect { post add_item_to_cart_url, params: { book_id: book.id } }.to change(LineItem, :count).by(1)
      expect(response).to redirect_to(cart_url(user.cart))
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE /destroy' do
    let!(:line_item) { create(:line_item, :to_cart) }

    it 'adds an item to cart' do
      expect { delete line_item_url(line_item) }.to change(LineItem, :count).by(-1)
      expect(response).to redirect_to(cart_url(user.cart))
    end
  end
end
