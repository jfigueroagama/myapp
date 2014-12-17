require "rails_helper"
require "spec_helper"
require "capybara/rspec"

feature "creating projects" do
  
  before do
    visit '/'
    click_link 'New Project'
  end
  
  scenario "can create a project" do
    fill_in "Name", with: "TextMate 2"
    fill_in "Description", with: "Text editor for OSX"
    click_button "Create Project"
    
    expect(page).to have_content("Project created")
  end
  
  scenario "cannot vreate aproject without name" do
    click_button "Create Project"
    
    expect(page).to have_content("Project not created")
    expect(page).to have_content("Name can't be blank")
  end
  
end
