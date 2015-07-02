feature 'user views list of cars' do
  scenario 'user views listing of all cars' do
    cars = FactoryGirl.create_list(:car, 3)

    visit cars_path

    cars.each do |car|
      expect(page).to have_content(car.color)
      expect(page).to have_content(car.year)
      expect(page).to have_content(car.description)
    end
  end
end
