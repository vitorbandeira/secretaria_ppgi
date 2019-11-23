class Attendance < ApplicationRecord
  validates :title, :content, presence: true , uniqueness: true
end
