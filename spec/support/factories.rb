FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "kristina#{n}@durr.com"}
    password 'bondra12'
    password_confirmation 'bondra12'
  end

  factory :beer_label do
    beer_name "Harpoon IPA"
    brewery "Harpoon"
    origin "USA"
    description "Hi"
    tag "IPA"
    user_id 1

    trait :with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'golden-monkey-logo.jpg')) }
    end
  end

  factory :vote do
    like 1
    voteable_id 1
    voteable_type "BeerLabel"
    user
  end

end
