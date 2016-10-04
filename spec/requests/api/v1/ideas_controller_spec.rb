require 'rails_helper'

describe "Ideas" do
  fixtures :ideas

  it 'returns JSON data on all ideas' do
    get '/api/v1/ideas'

    ideas = JSON.parse(response.body)
    idea = ideas.first

    expect(response).to be_success
    expect(ideas.length).to eq(3)
    expect(ideas.class).to eq(Array)
    expect(idea.class).to eq(Hash)
    expect(idea['id']).to eq(1)
    expect(idea['title']).to eq("Small Idea")
    expect(idea['body']).to eq("Not an amazing idea")
    expect(idea['quality']).to eq(0)
    expect(idea['created_at']).to eq('2016-10-01T09:54:09.000Z')
  end

  it 'returns JSON data on specific idea' do
    get '/api/v1/ideas/3'

    idea = JSON.parse(response.body)

    expect(response).to be_success
    expect(idea.class).to eq(Hash)
    expect(idea['id']).to eq(3)
    expect(idea['title']).to eq("Big Idea")
    expect(idea['body']).to eq("Amazing idea")
    expect(idea['quality']).to eq(2)
    expect(idea['created_at']).to eq('2016-10-01T09:54:09.000Z')
  end

  it 'returns ideas that can have different levels of quality' do
    get '/api/v1/ideas'

    ideas = JSON.parse(response.body)
    idea1 = ideas.first
    idea2 = ideas.second
    idea3 = ideas.third

    expect(ideas.length).to eq(3)
    expect(ideas.class).to eq(Array)
    expect(idea1.class).to eq(Hash)
    expect(idea2.class).to eq(Hash)
    expect(idea3.class).to eq(Hash)
    expect(idea1['id']).to eq(1)
    expect(idea2['id']).to eq(2)
    expect(idea3['id']).to eq(3)
    expect(idea1['quality']).to eq(0)
    expect(idea2['quality']).to eq(1)
    expect(idea3['quality']).to eq(2)
  end

  it 'can create an idea' do
    params = {title: "Fourth idea", body: "Not a bad idea", quality: 1}

    post '/api/v1/ideas', params: params

    expect(response).to be_success

    idea = Idea.last

    expect(idea.id).to eq(4)
    expect(idea.title).to eq("Fourth idea")
    expect(idea['body']).to eq("Not a bad idea")
    expect(idea.quality).to eq(1)
  end
end
