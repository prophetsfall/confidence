require 'rails_helper'

feature "Visitor sees the home page" do
  scenario "non-signed in user sees generic home page" do
    visit '/'
    expect(page).to have_content("Welcome to NFL Confidence Pool!")
    expect(page).to have_content("Register and join or create a league to get started!")
  end

end
