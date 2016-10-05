require 'rails_helper'

RSpec.feature 'User can see new idea form' do
  scenario 'visits root path' do
    visit '/'

    expect(current_path).to eq(root_path)

    expect(page).to have_button("Save")
    expect(page).to have_selector(".idea-form")
  end
end
