class SingleAccess < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :activity
end
