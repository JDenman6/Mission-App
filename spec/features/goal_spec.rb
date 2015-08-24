require 'spec_helper'
require 'rails_helper'

feature "CRUD" do
  before :each do
    visit new_user_url
    fill_in "Username", with: 'freddy'
    fill_in "Password", with: 'password'
    click_button 'Sign Up'
  end
  feature "Create" do
    it "has a create goal button" do
      visit '/goals'
      expect(page).to have_link "Create Goal"
    end

    it "has a create goal form" do
      visit '/goals'
      click_link "Create Goal"
      expect(page).to have_button "Submit Goal"
    end

    it "shows validation errors" do
      visit '/goals/new'
      fill_in "Body", with: "Take a shower"
      click_button "Submit Goal"
      expect(page).to have_content "Status can't be blank"
    end

    it "creates succssful goals" do
      visit '/goals/new'
      fill_in "Body", with: "Take a shower"
      choose "Private"
      click_button "Submit Goal"
      expect(page).to have_content "Take a shower"
    end

  end
  feature "Update" do
    it "updates a goal" do
    visit '/goals/new'
    fill_in "Body", with: "Take a shower"
    choose "Private"
    click_button "Submit Goal"
    choose "Public"
    click_button "Submit"
    expect(find_field("Public")).to be_checked
    end
  end

  feature "Destroy" do
    it "destroys a goal" do
      visit '/goals/new'
      fill_in "Body", with: "Take a shower"
      choose "Private"
      click_button "Submit Goal"
      visit user_url(User.find_by(username: "freddy"))
      expect(page).to have_button "Destroy Task"
      click_button "Destroy Task"
      expect(page).not_to have_content "Take a shower"
    end

  end
end
