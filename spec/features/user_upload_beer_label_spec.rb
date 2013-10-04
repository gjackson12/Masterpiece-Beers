require 'spec_helper'

feature 'Authenticated beer-label lover uploads label', %Q{
  As a logged in beer label lover
  I can upload an image of a beer label
  So that others can like/dislike it
  } do
  #
  # Acceptance Criteria:
  #
  # * I must add the name of the beer
  # * I must add the brewer
  # * I can add the location of the brewery (geotag)
  # * I can add a description
  # * I can add tags for searching

  scenario 'with valid info can upload image' do
    prev_count = BeerLabel.count
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    sign_in_as user
    visit new_beer_label_path
    beer_label = FactoryGirl.create(:beer_label)
    click_button 'Add Beer Label'
    expect(page).to have_content("Beer Name")

    visit new_beer_label_path
    expect(page).to have_selector('img')

    expect(BeerLabel.count).to eql(prev_count + 1)
  end

  scenario 'with invalid info, cannot upload image' do
    prev_count = BeerLabel.count
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    sign_in_as user
    visit new_beer_label_path
    click_on 'Add Beer Label'
    expect(BeerLabel.count).to eql(prev_count)
  end
end
