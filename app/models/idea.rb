class Idea < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :quality, presence: true

  def rating
    if self.quality == 0
      "Swill"
    elsif self.quality == 1
      "Plausible"
    else
      "Genius"
    end
  end
end
