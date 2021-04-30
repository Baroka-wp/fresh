class Breakship < ApplicationRecord
  belongs_to :breaked, class_name: "User"
  belongs_to :breaker, class_name: "User"
end
