require 'rails_helper'

RSpec.feature 'User can see new idea form' do
  scenario 'visits root path' do
    visit '/'

    expect(current_path).to eq(root_path)

    expect(page).to have_button("Create Idea")
    expect(page).to have_selector(".idea-form")
    within(".idea-form") do
      expect(page).to have_content("Enter your next idea")
    end
  end
end
