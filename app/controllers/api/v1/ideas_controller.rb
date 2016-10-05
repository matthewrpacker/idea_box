class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def show
    respond_with Idea.find(params[:id])
  end

  def create
    idea = Idea.create(idea_params)
    respond_with :api, :v1, idea
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.delete
  end

  private

  def idea_params
    params.permit(:title, :body, :quality)
  end
end
