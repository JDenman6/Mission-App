require 'spec_helper'
require 'rails_helper'

feature "the signup pocess" do
  before :each do
    visit "/users/new"
  end
  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end
  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      fill_in "Username", with: 'freddy'
      fill_in "Password", with: 'password'
      click_button 'Sign Up'
      expect(page).to have_content "Welcome"
      expect(page).to have_content "freddy"
    end
  end

end

feature "logging in" do
  it "shows username on the homepage after login" do
    User.create(username: "freddy", password: "password")
    visit "/session/new"
    fill_in "Username", with: 'freddy'
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    expect(page).to have_content "Welcome"
    expect(page).to have_content "freddy"
  end
end

feature "logging out" do
  it "begins with logged out state" do
    visit root_url
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
  end

  it "doesn't show username on the homepage after logout" do
    User.create(username: "freddy", password: "password")
    visit "/session/new"
    fill_in "Username", with: 'freddy'
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    click_link 'Sign Out'
    expect(page).to have_link 'Sign In'
    expect(page).not_to have_content 'freddy'
  end

end
