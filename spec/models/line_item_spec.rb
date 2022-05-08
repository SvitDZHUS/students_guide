# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:lineable) }
    it { is_expected.to belong_to(:book) }
  end
end
