class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.descending
  end
end
