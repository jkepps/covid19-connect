# frozen_string_literal: true

require 'rails_helper'

RSpec.describe License, type: :model do
  describe 'associations' do
    it { should belong_to(:volunteer).inverse_of(:license) }
  end

  describe 'associations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_equal_to(2) }
    it { should validate_presence_of(:volunteer) }
  end
end
