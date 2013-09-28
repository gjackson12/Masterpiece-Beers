require 'spec_helper'

describe BeerLabel do
  it { should have_valid(:brewery).when('Sam Adams', 'Harpoon') }
  it { should_not have_valid(:brewery).when(nil, '') }

  it { should have_valid(:origin).when('USA', 'England') }
  it { should_not have_valid(:origin).when(nil, '', 1234, "H3ll0") }
end
