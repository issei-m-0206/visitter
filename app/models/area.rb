class Area < ApplicationRecord
  has_many :tweet_areas
  has_many :tweets, through: :tweet_areas
end
