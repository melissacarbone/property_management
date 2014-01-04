require 'spec_helper'

feature 'User adds an owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # Acceptance Criteria:
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'with all required and valid attributes' do
    visit 'owners/new'

    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'john@example.com'
    click_on 'Create Owner'

    expect(page).to have_content('Owner was successfully created!')
    expect(Owner.all.count).to eq(1)
  end

  scenario 'with invalid attributes' do
    visit 'owners/new'
    click_on 'Create Owner'

    expect(page).to have_content("First name is invalid")
    expect(page).to have_content("Last name is invalid")
    expect(page).to have_content("Email is invalid")
    expect(Owner.all.count).to eq(0)
  end
end

