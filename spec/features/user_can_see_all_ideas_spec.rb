require 'rails_helper'

RSpec.feature 'visits root path' do
  fixtures :ideas

  scenario 'User can view all ideas' do

    visit '/'

    expect(current_path).to eq(root_path)

    within('.idea-head') do
      expect(page).to have_content("Ideas")
      expect(page).to have_content("Title")
      expect(page).to have_content("Body")
      expect(page).to have_content("Quality")
    end

    within('.idea-body') do
      Idea.all.each do |idea|
        expect(page).to have_selector('.idea')
        expect(page).to have_content(idea.title)
        expect(page).to have_content(idea.body)
        expect(page).to have_content(idea.rating)
      end
    end
  end

  scenario 'Idea body is always less than 100 characters' do
    visit '/'

    expect(current_path).to eq(root_path)

    within('.idea-body') do
      Idea.all.each do |idea|
        expect(idea.body.chars.count).to be < 101
      end
    end
  end
end
