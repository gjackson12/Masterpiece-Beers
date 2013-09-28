require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_valid(:email).when('john.smith@example.com', 'john.smith@aol+2.com')}
  it { should_not have_valid(:email).when(nil,'foo.com','') }

  it { should have_valid(:password).when('password','anotherpassword') }
  it { should_not have_valid(:password).when(nil,'pass','') }
end
