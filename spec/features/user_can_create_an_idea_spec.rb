require 'rails_helper'

describe "Create Idea", type: :feature, js: true do
  it "creates an idea" do
    visit '/'

    fill_in 'idea-title', with: 'New Idea'
    fill_in 'idea-body', with: 'This is a great idea'
    fill_in 'idea-quality', with: 2

    click_on 'Save'

    within('.idea-body') do
      expect(page).to have_content("New Idea")
      expect(page).to have_content("This is a great idea")
      expect(page).to have_content("Genuis")
    end
  end

  it "does not reload page when creating an idea" do
    visit '/'

    initial_page_id = assign_page_id

    fill_in 'idea-title', with: 'New Idea'
    fill_in 'idea-body', with: 'This is a great idea'
    fill_in 'idea-quality', with: 2

    click_on 'Save'

    page_reloaded = current_page_id != initial_page_id
    expect(page_reloaded).to eq(false)
  end
end
