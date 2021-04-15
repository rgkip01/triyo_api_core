class Customer < ApplicationRecord
  has_many :order_of_services
  
  enum customer_type: [:legal_person, :physical_person]

  validates_presence_of :customer_name
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.document_exists?(document)
    self.find_by(document: document)
  end
end
