require 'rails_helper'

feature "show", :js => true do
  scenario "show page" do
    visit root_path
    click_link "Sign up"
    fill_in('Email', :with => 'email@email.com')
    fill_in('City', :with => 'Salt Lake City')
    fill_in('State', :with => 'Utah')
    fill_in('Zip code', :with => '84115')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_button "Sign up"
    click_link "My Account"
    click_link "Add a Vehicle"
    make = 'Hyundai'
    model = 'Elantra'
    fill_in('Vehicle Make *', :with => make)
    fill_in('Vehicle Model *', :with => model)
    select 2013, :from => "vehicle_year"
    select 'Car', :from => "vehicle_type"
    fill_in('Vehicle Name *', :with => 'GLS 4dr Sedan (1.8L 4cyl 6A)')
    fill_in('Vehicle Mileage', :with => '5000')
    fill_in('Vehicle License Plate', :with => 'L35 A44')
    fill_in('State registered in *', :with => 'Utah')
    click_button "Create Vehicle"
    click_link "Hyundai Elantra"
    expect(page).to have_content('2013 Hyundai Elantra')
    click_link "Edit Vehicle"
    fill_in('Vehicle Mileage', :with => '45000')
    click_button 'Update Car'
    expect(page).to have_content('45000')
    click_link 'Delete Vehicle'
    # expect(page).to_not have_content ("#{make} #{model}")
  end
end
