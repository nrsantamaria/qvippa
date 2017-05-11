
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("", {:type => :feature}) do

  it("adds a new user to the database") do
    visit("/")
    fill_in("user_name", :with => "jim")
    fill_in("user_email", :with => "jim@email.com")
    click_button("Sign Up!")
    expect(page).to(have_content("jim"))
  end

  it("has a user page") do
    visit("/")
    fill_in("user_name", :with => "jim")
    fill_in("user_email", :with => "jim@email.com")
    click_button("Sign Up!")
    click_link("jim")
    expect(page).to(have_content("jim"))
  end

  it("adds a qvipp to the feed") do
    visit("/")
    fill_in("user_name", :with => "jim")
    fill_in("user_email", :with => "jim@email.com")
    click_button("Sign Up!")
    click_link("jim")
    fill_in("new_qvipp", :with => "i am dis")
    click_button("Add qVipp!")
    expect(page).to(have_content("i am dis"))
  end
end
