require 'spec_helper'

feature 'User adds a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do
  # Acceptance Criteria:

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'with all required and valid attributes' do
    visit 'buildings/new'

    fill_in 'Street Address', with: '33 Harrison Ave'
    fill_in 'City',           with: 'Boston'
    fill_in 'State',          with: 'MA'
    fill_in 'ZIP',            with: '02111'
    fill_in 'Description',    with: 'Close to dumplings and bubble tea'
    click_on 'Create Building'

    expect(page).to have_content('Building was successfully created!')
    expect(page).to have_content('Add a new building:')
  end

  scenario 'with invalid attributes' do
    visit 'buildings/new'

    click_on 'Create Building'

    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
  end

end
