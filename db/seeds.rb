# frozen_string_literal: true

[
  'Paramedic',
  'ER RN Pediatric',
  'LPN',
  'ICU RN',
  'Respiratory Therapist',
  'Retired RN'
].each { |title| Profession.find_or_create_by!(title: title) }

volunteer = Volunteer.create!(
  name: 'Test Volunteer',
  profession: Profession.first,
  zip: '90291',
  phone: '15555555555'
)

License.create!(
  volunteer: volunteer,
  full_name: 'Test Jacob Volunteer',
  number: '13446890',
  state: 'CA'
)

volunteer = Volunteer.create!(
  name: Faker::Name.name,
  profession: Profession.find((1..6).to_a.sample),
  zip: Faker::Address.zip,
  phone: "1#{Faker::PhoneNumber.cell_phone}"
)

License.create!(
  volunteer: volunteer,
  full_name: volunteer.name,
  number: Faker::Number.number(digits: 10),
  state: Faker::Address.state_abbr
)

volunteer = Volunteer.create!(
  name: Faker::Name.name,
  profession: Profession.find((1..6).to_a.sample),
  zip: Faker::Address.zip,
  phone: "1#{Faker::PhoneNumber.cell_phone}"
)

License.create!(
  volunteer: volunteer,
  full_name: volunteer.name,
  number: Faker::Number.number(digits: 10),
  state: Faker::Address.state_abbr
)

volunteer = Volunteer.create!(
  name: Faker::Name.name,
  profession: Profession.find((1..6).to_a.sample),
  zip: Faker::Address.zip,
  phone: "1#{Faker::PhoneNumber.cell_phone}"
)

License.create!(
  volunteer: volunteer,
  full_name: volunteer.name,
  number: Faker::Number.number(digits: 10),
  state: Faker::Address.state_abbr
)

volunteer = Volunteer.create!(
  name: Faker::Name.name,
  profession: Profession.find((1..6).to_a.sample),
  zip: Faker::Address.zip,
  phone: "1#{Faker::PhoneNumber.cell_phone}"
)

License.create!(
  volunteer: volunteer,
  full_name: volunteer.name,
  number: Faker::Number.number(digits: 10),
  state: Faker::Address.state_abbr,
  active: false,
  expiration_date: 1.month.ago
)
