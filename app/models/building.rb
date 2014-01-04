class Building < ActiveRecord::Base

  validates_presence_of :street_address, message: 'Please add a street address.'
  validates_presence_of :city,           message: 'Please add a city.'
  validates_presence_of :state,          message: 'Please add a state.'
  validates_presence_of :zip,            message: 'Please add a zip code.'

  validates_length_of :state, is: 2
  validates :state, format: { with: /\D/ }

end
