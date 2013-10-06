require 'spec_helper'

feature 'User searches for a beer by name in the search bar' , %Q{
  As a beer label lover
  I want to search for a beer by name
  So that I can easily and quickly find that beer
  } do

  scenario 'user queries with the search bar' do

    user = FactoryGirl.create(:user)
    current_label = FactoryGirl.create(:beer_label, :with_image)
    sign_in_as user

    visit beer_label_path(current_label)

    visit beer_labels_path

    fill_in 'q_beer_name_cont', with: current_label.beer_name

    click_button 'Search'

    expect(page).to have_selector('img')
  end
end
