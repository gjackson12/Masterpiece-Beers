require 'spec_helper'

describe Comment do
  it { should have_valid(:user_comment).when('Love the vintage look') }
  it { should_not have_valid(:user_comment).when(nil, '') }

  it { should belong_to(:beer_label) }
end
