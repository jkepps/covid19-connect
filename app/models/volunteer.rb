# frozen_string_literal: true

class Volunteer < ApplicationRecord
  geocoded_by :zip

  after_validation :geocode

  belongs_to :profession
  has_one :license, inverse_of: :volunteer

  validates :name, presence: true
  validates :profession, presence: true
  validates :zip, presence: true
  validates :phone, phone: { possible: true, countries: :us, allow_blank: false }

  accepts_nested_attributes_for :license

  delegate :title, to: :profession
  delegate :number, :state, :expiration_date, :active, to: :license, prefix: true
end
