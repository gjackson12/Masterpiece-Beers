require 'spec_helper'

feature 'user signs up for the site', %Q{
  As an unauthenticated user
  I want to login to the site with my Facebook account
  So that I can share my favorite beer labels
} do

  # Acceptance Criteria
# * I must be currently logged in to my Facebook account
# * I must be re-directed to the Facebook login page if I 
#   attempt to login without being on Facebook at the time
# * I should be logged into the site if I am currently logged in
#   to Facebook

  # scenario 'logs into the site via their Facebook account' do
  #     set_omniauth
  #     visit new_user_registration_path
  #     click_link 'Sign in with Facebook'
  #     expect(page).to have_content('Successfully authenticated from Facebook account.')
  # end

end