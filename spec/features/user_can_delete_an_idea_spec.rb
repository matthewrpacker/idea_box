require 'rails_helper'

describe "Delete an idea", type: :feature, js: true do
  it "can delete a created idea" do
    visit '/'

    fill_in 'idea-title', with: 'Newest Idea'
    fill_in 'idea-body', with: 'This is a decent idea'

    click_on 'Save'

    within('.idea-body tr:nth-child(1)') do
      expect(page).to have_content("Newest Idea")
      expect(page).to have_content("This is a decent idea")
      expect(page).to have_content("Swill")
    end

    within('.idea-body tr:nth-child(1)') do
      click_on "Delete"
    end

    within('.idea-body') do
      expect(page).to_not have_content("Newest Idea")
      expect(page).to_not have_content("This is a decent idea")
    end
  end

  it "does not reload page when deleting an idea" do
    visit '/'

    initial_page_id = assign_page_id

    fill_in 'idea-title', with: 'New Idea'
    fill_in 'idea-body', with: 'This is a great idea'

    click_on 'Save'

    page_reloaded = current_page_id != initial_page_id
    expect(page_reloaded).to eq(false)

    within('.idea-body tr:nth-child(1)') do
      click_on "Delete"
    end

    page_reloaded = current_page_id != initial_page_id
    expect(page_reloaded).to eq(false)
  end
end
