class Contract < ApplicationRecord
  belongs_to :owner, class_name: "User" ,foreign_key: "owner_id"
  belongs_to :client, class_name: "User",foreign_key: "client_id"
  has_many :transactions
end
