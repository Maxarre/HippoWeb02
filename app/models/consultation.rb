class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :emails
  acts_as_taggable_on :tags
  # validates :start_time, uniqueness: true
end
