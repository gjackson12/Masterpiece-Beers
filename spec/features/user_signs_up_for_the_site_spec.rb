require 'spec_helper'

feature 'user signs up for the site', %Q{
  As an unauthenticated user
  I want to sign up for the site
  So that I can share my favorite beer labels
} do

  # Acceptance Criteria
# * I must specify a valid e-mail address
# * I must specify a password and confirm the password
# * I must provide a password that is 8 characters long
# * If I submit my information without a password that is 8 characters 
#   long I will displayed a message asking me to re-enter the password
# * If I do not enter any of the above fields I will be prompted to 
#   enter that information

  scenario 'specifies valid information' do
    prev_user_count = User.count
    visit new_user_registration_path
    fill_in "Email", with: "john.smith@americanredcross.com"
    fill_in "Password", with: "bondra12", :match => :prefer_exact
    fill_in "Password confirmation", with: "bondra12", :match => :prefer_exact
    click_button 'Sign up'
    expect(page).to have_content('successfully')
    expect(User.count).to eql(prev_user_count + 1)
  end


  scenario 'does not specify required information' do
    prev_user_count = User.count
    visit new_user_registration_path
    click_button 'Sign up'
    expect(User.count).to eql(prev_user_count)
    
    within ".user_email" do
        expect(page).to have_content "can't be blank"
    end

    within ".user_password" do
        expect(page).to have_content "can't be blank"
    end

  end

  scenario 'does not specify an 8 character password, told to provide 8 character password' do
    prev_user_count = User.count
    visit new_user_registration_path
    fill_in "Email", with: "john.smith@americanredcross.com"
    fill_in "Password", with: "bondra", :match => :prefer_exact
    fill_in "Password confirmation", with: "bondra", :match => :prefer_exact
    click_button 'Sign up'

    within ".user_password" do
        expect(page).to have_content 'is too short (minimum is 8 characters)'
    end
    expect(User.count).to eql(prev_user_count)
  end

end