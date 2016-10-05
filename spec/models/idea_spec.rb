require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :quality }

  it 'should order ideas by created at descending' do
    idea1 = Idea.create(title: "New Idea", body: "This is a new idea")
    idea2 = Idea.create(title: "Newest Idea", body: "This is a newer idea")

    ideas = Idea.all.descending
    expect(ideas.first.title).to eq("Newest Idea")
  end
end
