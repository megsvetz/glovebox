require 'rails_helper'


feature "navbar", :js => true do
  scenario "Navbar contains About, Login, Sign Up" do
    visit root_path
    expect(page).to have_content "About"
    expect(page).to have_content "Login"
    expect(page).to have_content "Sign Up"
  end
  scenario "When click on login goes to login page" do
    visit root_path
    click_link "Login"
    expect(find_field("Email").visible?).to eq(true)
    expect(find_field("Password").visible?).to eq(true)
    expect(find_button("Login").visible?).to eq(true)
  end
  scenario "When click on Sign Up goes to Sign Up page" do
    visit root_path
    click_link "Sign Up"
    expect(page).to have_content "Sign Up"
    expect(find_field("Email").visible?).to eq(true)
    expect(find_field("City").visible?).to eq(true)
    expect(find_field("State").visible?).to eq(true)
    expect(find_field("Zip code").visible?).to eq(true)
    expect(find_field("Password").visible?).to eq(true)
    expect(find_button("Sign Up").visible?).to eq(true)

  end

end


