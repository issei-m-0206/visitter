class TweetArea < ApplicationRecord
  belongs_to :tweet, optional: true
  belongs_to :area, optional: true
end
