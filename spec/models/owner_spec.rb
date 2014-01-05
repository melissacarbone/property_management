require 'spec_helper'

describe Owner do

  let(:owner) { FactoryGirl.build(:owner) }

  it "is valid when it has all required and valid attributes" do
    expect(owner).to be_valid
  end

  it { should have_many(:buildings).dependent(:nullify) }

  it { should have_valid(:first_name).when('John', 'Sue') }
  it { should_not have_valid(:first_name).when('', nil, 123) }

  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should_not have_valid(:last_name).when('', nil, 123) }

  it { should have_valid(:email).when('test@test.com', 'example123@example.us') }
  it { should_not have_valid(:email).when('', nil, 123, 'user@com', 'user.com') }

end
