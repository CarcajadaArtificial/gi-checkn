class Event < ApplicationRecord
  has_many :users, through: :roles
  has_many :activities
  has_many :ticket_types
  has_many :questions, through: :ticket_types
end
