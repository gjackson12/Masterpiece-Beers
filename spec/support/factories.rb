FactoryGirl.define do
  factory :user do
    email 'john.smith@example.com'
    password 'bondra12'
    password_confirmation 'bondra12'
  end

  factory :beer_label do
    beer_name "Golden Monkey"
    brewery "Monkey"
    origin "USA"
    description "Hi"
    tag "IPA"
  end

  factory :beer_label_test do
    beer_name "Heineken"
    brewery "Heineken"
    origin "Holland"
  end

    trait :with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'golden-monkey-logo.jpg')) }
    end


end
