# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:cover) }
    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to validate_presence_of(:categories) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:categories) }
  end
end
