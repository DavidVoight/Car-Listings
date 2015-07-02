require 'rails_helper'

feature 'adding cars', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  scenario 'user adds a car sucessfully' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_car_path

    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: "Blue"
    fill_in "Year", with: "2010"
    fill_in "Mileage", with: "100000"

    click_on "Add Car"

    expect(page).to have_content ("Car Saved.")
    expect(page).to have_content manufacturer.name
  end

  scenario 'user is unable to add a car successfully' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_car_path

    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: ""
    fill_in "Year", with: ""
    fill_in "Mileage", with: ""

    click_on "Add Car"

    expect(page).to have_content ("Color can't be blank")
    expect(page).to have_content ("Year can't be blank")
    expect(page).to have_content ("Mileage can't be blank")
  end

  scenario 'user tries to add a car year before 1920' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_car_path

    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: "Blue"
    fill_in "Year", with: "1900"
    fill_in "Mileage", with: "20000"

    click_on "Add Car"

    expect(page).to have_content ("car must be greater than or equal to 1920")
  end
end
