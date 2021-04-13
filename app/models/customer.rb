class Customer < ApplicationRecord
  enum customer_type: [:legal_person, :physical_person]

  validates_presence_of :customer_name

  def self.document_exists?(document)
    self.find_by(document: document)
  end
end
