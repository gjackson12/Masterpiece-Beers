require 'spec_helper'

describe Vote do

  it { should belong_to :voteable }

  it { should validate_presence_of :voteable_id }
  it { should validate_presence_of :voteable_type }
  it { should validate_presence_of :user_id }

  it "should return the number of likes for a beer_label" do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label)
    vote = FactoryGirl.create(:vote, user_id: user.id, voteable_id: beer_label.id, voteable_type: beer_label)
    expect(bl_like_count(beer_label.id)).to eql(1)
  end
  
end
