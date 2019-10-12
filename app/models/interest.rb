class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :to, class_name: "User"
end
