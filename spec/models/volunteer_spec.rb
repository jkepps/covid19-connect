# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  subject(:volunteer) { FactoryBot.create(:volunteer) }

  describe 'associations' do
    it { should belong_to(:profession) }
    it { should have_one(:license).inverse_of(:volunteer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:profession) }
    it { should validate_presence_of(:zip) }
    it { should allow_value('1 123-456-7890').for(:phone) }
    it { should_not allow_value('').for(:phone) }
    it { should_not allow_value(nil).for(:phone) }
  end
end
