require 'spec_helper'

feature 'Beer-label-lover can up/down vote comment', %Q{
  As a logged-in Beer-label-lover
  I want to be able to up/down vote a comment for a given beer label
  So that I can contribute to the popularity, or lack of, their comment
  } do

# Acceptance Criteria:

# * Beer-label-lover must be logged-in
# * Must be on a details page for a beer-label
# * Must be able to like/dislike a beer-label
# * Must not like/dislike more than once for a given beer

  scenario 'up-votes a beer label' do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label, user_id: user.id)
    prev_vote_count = Vote.count
    prev_score_count = Vote.score(beer_label)

    sign_in_as user

    visit beer_label_path(beer_label)
    click_on "Like"

    expect(Vote.count).to eql(prev_vote_count + 1)

    expect(Vote.score(beer_label)).to eql(prev_score_count + 1)
  end

  scenario 'attempts to upvote a beer label again' do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label, user_id: user.id)
    sign_in_as user
    visit beer_label_path(beer_label)
    click_on "Like"
    prev_vote_count = Vote.count
    prev_score_count = Vote.score(beer_label)

    click_on "Like"

    expect(Vote.count).to eql(prev_vote_count)
    expect(Vote.score(beer_label)).to eql(prev_score_count)
  end

   scenario 'up-votes a beer label' do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label, user_id: user.id)
    prev_vote_count = Vote.count
    prev_score_count = Vote.score(beer_label)

    sign_in_as user

    visit beer_label_path(beer_label)
    click_on "Like"

    expect(Vote.count).to eql(prev_vote_count + 1)
    expect(Vote.score(beer_label)).to eql(prev_score_count + 1)
  end

end