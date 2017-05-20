class Contract < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :client, class_name: "User"
end
