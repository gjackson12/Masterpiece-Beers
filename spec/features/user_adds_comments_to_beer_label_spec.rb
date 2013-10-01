require 'spec_helper'

feature 'Authenticated beer-label lover adds comments to beer label' , %Q{
  As a logged in beer label lover
  I can comment on a beer label
  So that others can see what I think about it
  } do

  scenario 'logged in' do

    prev_count = Comment.count
    visit new_beer_label_path
    current_label = FactoryGirl.create(:beer_label)
    # fill_in 'Beer Name', with: 'Sam Adams Summer Ale'
    # fill_in 'Brewery', with: 'Sam Adams'
    # fill_in 'Origin', with: 'USA'
    # fill_in 'Description', with: 'Delicious'
    # fill_in 'Tag', with: 'Summer Ale'
    click_on 'Add Beer Label'

    fill_in '', with: 'Greatest beer label EVAR!'

    click_on 'Create Comment'
    expect(page).to have_content('Comment successfully added.')
    expect(Comment.count).to eql(prev_count + 1)
  end

end



