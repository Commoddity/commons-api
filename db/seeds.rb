# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Data ...'

unless Rails.env.development?
  puts 'Development seeds only (for now)!'
  exit 0
end

puts 'Creating Parliamentary Sessions ...'

ParliamentarySession.destroy_all

ParliamentarySession.create!(
  number: 1,
  start_date: Date.new(2019, 12, 0o5),
  end_date: nil
)

puts 'Creating Categories ...'

Category.destroy_all

Category.create!(
  id: 1,
  name: 'Agriculture, environment, fisheries and natural resources',
  uclassify_class: 'agriculture_environment'
)

Category.create!(
  id: 2,
  name: 'Arts, culture and entertainment',
  uclassify_class: 'arts_culture'
)

Category.create!(
  id: 3,
  name: 'Business, industry and trade',
  uclassify_class: 'business_industry'
)

Category.create!(
  id: 4,
  name: 'Economics and finance',
  uclassify_class: 'economics_finance'
)

Category.create!(
  id: 5,
  name: 'Education, language and training',
  uclassify_class: 'education_language'
)

Category.create!(
  id: 6,
  name: 'Employment and labour',
  uclassify_class: 'employment_labour'
)

Category.create!(
  id: 7,
  name: 'Government, Parliament and politics',
  uclassify_class: 'government_politics'
)

Category.create!(id: 8,
                 name: 'Health and safety',
                 uclassify_class: 'health_safety')

Category.create!(
  id: 9,
  name: 'Indigenous affairs',
  uclassify_class: 'indigenous_affairs'
)

Category.create!(
  id: 10,
  name: 'Information and communications',
  uclassify_class: 'information_communications'
)

Category.create!(
  id: 11,
  name: 'International affairs and defence',
  uclassify_class: 'international_affairs'
)

Category.create!(
  id: 12,
  name: 'Law, justice and rights',
  uclassify_class: 'law_justice'
)

Category.create!(
  id: 13,
  name: 'Science and technology',
  uclassify_class: 'science_technology'
)

Category.create!(
  id: 14,
  name: 'Social affairs and population',
  uclassify_class: 'social_affairs'
)

puts 'Database Seeded!'
