require 'rails_helper'

feature 'create manufacturers', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  scenario 'user adds a manufacturer successfully' do

    visit new_manufacturer_path

    fill_in "Name", with: "BMW"
    fill_in "Country", with: "Germany"

    click_on "Create Manufacturer"
    expect(page).to have_content ("BMW")
    expect(page).to have_content ("Germany")
    expect(page).to have_content ("Manufacturer Added.")

  end

  scenario 'user is unable to add a manufacturer' do

    visit new_manufacturer_path

    fill_in "Name", with: ""
    fill_in "Country", with: ""

    click_on "Add Manufacturer"
    expect(page).to have_content ("Name can't be blank")
    expect(page).to have_content ("Country can't be blank")

  end

  scenario 'user is unable to add a duplicate manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path

    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country

    click_on "Add Manufacturer"
    expect(page).to have_content ("Name has already been taken")

  end

end
