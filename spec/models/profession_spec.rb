# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profession, type: :model do
  describe 'associations' do
    it { should have_many(:volunteers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
