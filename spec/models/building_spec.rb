require 'spec_helper'

describe Building do
  it { should belong_to(:owner) }

  it { should have_valid(:street_address).when("33 Harrison Ave") }
  it { should_not have_valid(:street_address).when(nil, "") }

  it { should have_valid(:city).when('Boston', 'New York') }
  it { should_not have_valid(:city).when(nil, "") }

  it { should have_valid(:state).when('MA', 'NY') }
  it { should_not have_valid(:state).when(nil, "", 12, 'New York') }

  it { should have_valid(:zip).when('12345', '02111') }
  it { should_not have_valid(:zip).when(nil, "", '1234567') }

end
