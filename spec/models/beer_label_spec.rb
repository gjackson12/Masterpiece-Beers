require 'spec_helper'

describe BeerLabel do
  it { should have_valid(:brewery).when('Sam Adams', 'Harpoon') }
  it { should_not have_valid(:brewery).when(nil, '') }
end
