require 'spec_helper'

describe BeerLabel do
  it { should have_valid(:brewery).when('Sam Adams', 'Harpoon') }
  it { should_not have_valid(:brewery).when(nil, '') }

  it { should have_valid(:origin).when('USA', 'England') }
  it { should_not have_valid(:origin).when(nil, '', 1234, "H3ll0") }

  it 'is created and pending' do
    beer_label = FactoryGirl.create(:beer_label)
    beer_label.pending?.should be_true
  end

  it 'with 5 likes is approved', focus: true do
    user = FactoryGirl.create(:user)
    beer_label = FactoryGirl.create(:beer_label)
    beer_label.like = 4
    sign_in_as user
    visit beer_label_path(beer_label)
    expect(beer_label.state).to eql('pending')
    click_on 'Like'
    expect(beer_label.state).to eql('approved')
    
  end


end
