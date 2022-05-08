# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name).on(:update) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(3).is_at_most(255).on(:update) }
    it { is_expected.to validate_presence_of(:last_name).on(:update) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(3).is_at_most(255).on(:update) }
    it { is_expected.to validate_length_of(:phone).is_at_least(3).is_at_most(25).on(:update) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:owned_by) }
  end
end
