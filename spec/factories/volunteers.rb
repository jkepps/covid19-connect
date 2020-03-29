# frozen_string_literal: true

FactoryBot.define do
  factory :volunteer do
    name { 'Volunteer' }
    profession
    zip { '12345' }
    phone { "+1#{Faker::PhoneNumber.cell_phone}" }
  end
end
