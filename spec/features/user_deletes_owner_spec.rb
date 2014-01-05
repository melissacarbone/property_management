require 'spec_helper'

feature 'User deletes an owner' do
  scenario 'without destroying associated buildings' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building)
    building.owner_id = owner.id

    visit 'owners/'
    click_on 'Destroy'

    expect(Owner.all.count).to eq(0)
    expect(Building.all.count).to eq(1)

    building = Building.find(building.id)
    expect(building.owner_id).to eq(nil)
  end
end
