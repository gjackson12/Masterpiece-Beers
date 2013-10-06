require 'spec_helper'

describe 'Beer Label image' do

  it 'is created and pending' do
    beer_label = FactoryGirl.create(:beer_label)
    beer_label.pending?.should be_true
  end

  it 'with 5 likes is approved' do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label)
    FactoryGirl.create_list(:vote, 4, voteable_id: beer_label.id)

    sign_in_as user
    visit beer_label_path(beer_label)
    expect(beer_label.state).to eql('pending')
    click_on 'Like'
    expect(beer_label.reload.state).to eql('approved')
  end

  it 'with 5 dislikes is rejected' do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label)
    FactoryGirl.create_list(:vote, 4, like: -1, voteable_id: beer_label.id)

    sign_in_as user
    visit beer_label_path(beer_label)
    expect(beer_label.state).to eql('pending')
    click_on 'Dislike'
    expect(beer_label.reload.state).to eql('rejected')
  end
end
