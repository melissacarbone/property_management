class Owner < ActiveRecord::Base
  has_many :buildings, dependent: :nullify

  validates :first_name, format: { with: /[a-zA-Z]+/ }
  validates :last_name, format: { with: /[a-zA-Z]+/ }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
