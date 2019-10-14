class User < ApplicationRecord
  has_many :interests
  has_many :to_interests, through: :interests, source: :user_id


end
