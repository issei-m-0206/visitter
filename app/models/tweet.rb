class Tweet < ApplicationRecord
  validates :text, presence: true
  has_many :tweet_areas
  has_many :areas, through: :tweet_areas, dependent: :destroy
  belongs_to :user
end
