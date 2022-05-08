# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shelf, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:owned_by) }
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:books) }
  end
end
