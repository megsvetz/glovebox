require 'rails_helper'

feature "navbar", :js => true do 
  scenario "Navbar contains About, Login, and Sign up." do 
   visit root_path
   expect(page).to have_content "About"
   expect(page).to have_content "Login"
   expect(page).to have_content "Sign up"
  end
end