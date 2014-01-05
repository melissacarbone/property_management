class Building < ActiveRecord::Base
  belongs_to :owner

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  validates_length_of :zip, is: 5
  validates_length_of :state, is: 2

  validates :state, format: { with: /\D/ }
end
