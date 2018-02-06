require 'rails_helper'

feature "as an authenticated user I be able to create a league " do
  let!(:user1) {FactoryBot.create(:user)}
  let!(:user2) {FactoryBot.create(:user)}
  let!(:league1) {FactoryBot.create(:league)}
  let!(:league2) {FactoryBot.create(:league)}
  let!(:league3) {FactoryBot.create(:league)}
  let!(:mem1) {Membership.create!(user:user1,league:league1)}
  let!(:mem2) {Membership.create!(user:user1,league:league2)}
  let!(:mem3) {Membership.create!(user:user2,league:league3)}

  scenario "User creates a public league" do
    visit "/"
    click_link "Registered users click here to sign in!"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    click_link "Click here to create a custom league!"
    fill_in "League name", with: "This is a custom league"
    fill_in "Max members", with: 10
    choose "public-league-button"
    click_button "Create League"

    expect(page).to have_content "League Created Successfully!"
    expect(page).to have_content "League Homepage for This is a custom league"
    expect(page).to have_content user1.username
    expect(page).to have_no_content user2.username
  end
  scenario "User creates a public league" do
    visit "/"
    click_link "Registered users click here to sign in!"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    click_link "Click here to create a custom league!"
    fill_in "League name", with: "This is a custom league"
    fill_in "Max members", with: 10
    choose "private-league-button"
    click_button "Create League"

    expect(page).to have_content "League Created Successfully!"
    expect(page).to have_content "League Homepage for This is a custom league"
    expect(page).to have_content user1.username
    expect(page).to have_no_content user2.username
  end
end
