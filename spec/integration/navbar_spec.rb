require 'rails_helper'


feature "navbar", :js => true do
  scenario "Navbar contains About, Login, Sign up" do
    visit root_path
    expect(page).to have_content "About"
    expect(page).to have_content "Login"
    expect(page).to have_content "Sign up"
  end
  scenario "When click on login goes to login page" do
    visit root_path
    click_link "Login"
    expect(find_field("Email").visible?).to eq(true)
    expect(find_field("Password").visible?).to eq(true)
    expect(find_button("Log in").visible?).to eq(true)
  end
  scenario "When click on Sign up goes to Sign up  page" do
    visit root_path
    click_link "Sign up"
    expect(page).to have_content "Sign up"
    expect(find_field("Email").visible?).to eq(true)
    expect(find_field("City").visible?).to eq(true)
    expect(find_field("State").visible?).to eq(true)
    expect(find_field("Zip code").visible?).to eq(true)
    expect(find_field("Password").visible?).to eq(true)
    expect(find_button("Sign up").visible?).to eq(true)
    
  end

end


