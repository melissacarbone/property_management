require 'spec_helper'

describe Owner do
  it { should have_valid(:first_name).when('John', 'Sue') }
  it { should_not have_valid(:first_name).when('', nil, 123) }

  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should_not have_valid(:last_name).when('', nil, 123) }

  it { should have_valid(:email).when('test@test.com', 'example123@example.us') }
  it { should_not have_valid(:email).when('', nil, 123, 'user@com', 'user.com') }

end
