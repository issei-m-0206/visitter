class Relationship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :follower, class_name: "User", optional: true
  belongs_to :following, class_name: "User", optional: true
  validates :follower_id, presence: true
  validates :following_id, presence: true
end
