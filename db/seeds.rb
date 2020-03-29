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
