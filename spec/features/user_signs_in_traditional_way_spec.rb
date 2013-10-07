require 'spec_helper'

feature 'user signs in', %Q{
  As an unauthenticated user
  I want to sign in
  So that I can share my favorite beer labels
} do

  # Acceptance Criteria
# * I must specify my e-mail address
# * I must specify my password
# * If I do not enter the correct information I will be prompted to 
#   enter it again
# * If I enter my e-mail address and password correctly I will be
#   signed into the application

  scenario 'specifies valid information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    sign_in_as user
    expect(page).to have_content(user.email)
  end

  scenario 'specifies invalid information' do
    visit new_user_session_path
    fill_in "Email", with: 'graham.jackson07@gmail.com' 
    fill_in "Password", with: 'fakepassword'
    click_button 'Sign in'
    expect(page).to have_content('Password')
  end

end