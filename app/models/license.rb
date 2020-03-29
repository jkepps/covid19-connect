# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :volunteer, inverse_of: :license

  validates :number, presence: true
  validates :full_name, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :volunteer, presence: true
end
