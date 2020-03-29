# frozen_string_literal: true

class Profession < ApplicationRecord
  has_many :volunteers

  validates :title, presence: true
end
