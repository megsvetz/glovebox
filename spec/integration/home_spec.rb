require 'rails_helper'

feature "home", :js => true do
  scenario "home page contains content" do
    visit root_path
    expect(page).to have_content "GLOVEBOX"
    expect(page).to have_content "Features of GloveBox"
    expect(page).to have_content "Basic Versus Premium Membership"
    expect(page).to have_content "The GLOVEBOX Team"
    expect(page).to have_content "Contact Us"
  end

  scenario "gas icon takes unsigned in to login page" do
    visit root_path
    find(:xpath, "//a/img[@alt='gas']/..").click
    expect(page).to have_content "Login"
    expect(page).to have_content "Email"
    expect(page).to have_content "Remember me"
  end

  scenario "sign up link goes to sign up page" do
    visit root_path
    click_link('Sign Up')
    expect(find_field("Email").visible?).to eq(true)
    expect(find_field("City").visible?).to eq(true)
    expect(find_field("State").visible?).to eq(true)
    expect(find_field("Zip code").visible?).to eq(true)
    expect(find_field("Password").visible?).to eq(true)
    expect(find_button("Sign Up").visible?).to eq(true)
  end
end
