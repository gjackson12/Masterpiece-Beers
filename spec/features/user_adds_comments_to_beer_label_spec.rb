require 'spec_helper'

feature 'Authenticated beer-label lover adds comments to beer label' , %Q{
  As a logged in beer label lover
  I can comment on a beer label
  So that others can see what I think about it
  } do

  scenario 'logged in' do
    user = FactoryGirl.create(:user)
    current_label = FactoryGirl.create(:beer_label, :with_image)
    sign_in_as user
    expect(current_label).to have(0).comments

    visit beer_label_path(current_label)

    fill_in "comment[user_comment]", with: 'Greatest beer label EVAR!'
    click_on 'Create Comment'

    expect(page).to have_content(current_label.comments.last)
    expect(current_label.reload).to have(1).comments
  end

end



