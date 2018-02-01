class Event < ApplicationRecord
  # Model relations.
  has_many :users, through: :roles
  has_many :activities
  has_many :ticket_types
  has_many :questions, through: :ticket_types
  # Legible url and find override.
  validates_uniqueness_of :urlName
  def to_param
    urlName
  end
  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_urlName(input)
    end
  end
end
