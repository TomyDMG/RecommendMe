namespace :db do

  task :populate => :environment do
    require 'populator'
    require 'faker'
# Populate DB with Users
User.populate(50) do |user|
  user.email = Faker::Internet.email
  user.name = Faker::Internet.user_name
  user.created_at = Faker::Time.backward(14, :evening)
  end
  end
end
  