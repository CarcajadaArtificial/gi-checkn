class Attendance < ApplicationRecord
  belongs_to :ticket
  belongs_to :activity
end
