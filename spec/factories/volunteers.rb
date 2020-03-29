# frozen_string_literal: true

FactoryBot.define do
  factory :volunteer do
    name { 'Volunteer' }
    profession
    zip { '12345' }
    phone { '15555555555' }
  end
end
