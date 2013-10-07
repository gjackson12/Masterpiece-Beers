require 'spec_helper'

feature 'User can edit their uploaded beer label', %Q{
  As a logged in User
  I can edit a beer label I uploaded
  So I can change anything I do not like
} do

  scenario 'current user can edit their beer label' do
    beer_label = FactoryGirl.create(:beer_label)
    user = FactoryGirl.create(:user)
    sign_in_as user
    visit beer_label_path(beer_label)
    click_on 'Edit'
    visit edit_beer_label_path(beer_label)
    expect(page).to have_content('Edit')
    fill_in 'Beer Name', with: 'Harpoon Octoberfest'
    click_on 'Update Beer Label'

    expect(page).to have_content('Beer Name')
  end

end
