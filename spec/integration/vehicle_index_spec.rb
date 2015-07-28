require 'rails_helper'

feature "index", :js => true do
 scenario "sign up page" do
    visit root_path
    #create new user
    click_link "Sign up"
    fill_in('Email', :with => 'email@email.com')
    fill_in('City', :with => 'Salt Lake City')
    fill_in('State', :with => 'Utah')
    fill_in('Zip code', :with => '84115')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_button "Sign up"
    #visit index page
    click_link "My Account"

    click_link "See My Vehicles"
    click_link "New Vehicle"
    #create new vehicle
    select 'Car', :from => "vehicle_type"
    select 2013, :from => "vehicle_year"
    fill_in('Vehicle Make *', :with => 'Nissan')
    fill_in('Vehicle Model *', :with => 'Sentra')
    fill_in('Vehicle Name *', :with => 'Prescilla')
    fill_in('State registered in *', :with => 'CA')
    # fill_in
    sleep 2
    click_button('Create Vehicle')
    sleep 2
    #check to make sure you are on the index page
    expect(page).to have_content('Your Vehicles')
    click_link 'See All Vehicle Insurances'
    #insurance index page
    expect(page).to have_content('All Vehicle Insurances')
    click_link 'Back to My Vehicles'
    #vehicle index
    expect(page).to have_content('Your Vehicles')
    click_link 'See All Vehicle Registrations'
    #registration index page
    expect(page).to have_content('All Vehicle Registrations')
    click_link 'Back to My Vehicles'

    #check index page for new car created
    expect(page).to have_content('Sentra')
    click_link "Nissan Sentra"
    #check path to be vehicle show page
    expect(page).to have_content('Repairs and Maintenance Costs')
    click_link 'Back'
    #back to index page
    expect(page).to have_content('Your Vehicles')
    click_link 'See Repairs'
    #repair page
    expect(page).to have_content('All Vehicle Repairs')
    #vehicle show
    click_link 'Vehicle Details'
    #vehicle index
    click_link 'Back'

    click_link 'Add Insurance'
    expect(page).to have_content('New Insurance')

    fill_in('Company', :with => 'Geico')
    fill_in('Policy Number', :with => 'ABC123')
    fill_in('Cost of Policy', :with => '65.78')

 end
end


