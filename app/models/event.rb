class Event < ApplicationRecord
  has_many :users, through: :roles
end
