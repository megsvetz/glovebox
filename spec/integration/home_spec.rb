require 'rails_helper'

feature "home", :js => true do
  scenario "header" do
    visit root_path
    expect(page).to have_content "GLOVEBOX"
  end
end
