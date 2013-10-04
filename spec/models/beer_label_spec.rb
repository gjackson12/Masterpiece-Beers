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

  it 'is accepted' do
    beer_label = FactoryGirl.create(:beer_label)
    beer_label.approve
    beer_label.approved?.should be_true
    beer_label.rejected?.should_not be_true
  end

  it 'is rejected' do
    beer_label = FactoryGirl.create(:beer_label)
    beer_label.reject
    beer_label.rejected?.should be_true
  end
end
