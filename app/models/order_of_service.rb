class OrderOfService < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates_uniqueness_of :id
  validates_presence_of :os_number
  validates_uniqueness_of :os_number
end
