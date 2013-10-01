FactoryGirl.define do
  factory :user do
    email 'john.smith@example.com'
    password 'bondra12'
    password_confirmation 'bondra12'
  end

  factory :beer_label do
    beer_name "Harpoon IPA"
    brewery "Harpoon"
    origin "USA"
    description "Hi"
    tag "IPA"
  end
end