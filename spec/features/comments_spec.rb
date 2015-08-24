feature "User comments" do
  before :each do
    User.create(username: "freddy", password: "password")
    visit "/session/new"
    fill_in "Username", with: 'freddy'
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    visit "/users"
  end
  it "has a text area for a comment" do
    expect(page).to have_content "Add comment to user"
  end
  it "has a submit button for a comment" do
    expect(page).to have_button "Submit comment"
  end
  it "can submit comments" do
    fill_in "Add comment to user", with: "First comment"
    click_button "Submit comment"
    expect(page).to have_content "First comment"
  end
end

feature "Task comments" do
  before :each do
    User.create(username: "freddy", password: "password")
    visit "/session/new"
    fill_in "Username", with: 'freddy'
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    visit "/goals"
  end
  it "has a text area for a comment" do
    expect(page).to have_content "Add comment to task"
  end
  it "has a submit button for a comment" do
    expect(page).to have_button "Submit comment"
  end
  it "can submit comments" do
    fill_in "Add comment to user", with: "Second comment"
    click_button "Submit comment"
    expect(page).to have_content "Second comment"
  end
end
