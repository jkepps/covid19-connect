# frozen_string_literal: true

class Volunteer < ApplicationRecord
  belongs_to :profession
  has_one :license, inverse_of: :volunteer

  validates :name, presence: true
  validates :profession, presence: true
  validates :zip, presence: true
  validates :phone, phone: { possible: true, countries: :us, allow_blank: false }
end
