class Patient < ApplicationRecord
  belongs_to :user
  has_many :consultations
  has_many :emails, through: :consultations

  def full_name
    "#{first_name} #{last_name}"
  end

  # include PgSearch
  # pg_search_scope :search_by_first_name_and_last_name,
  #   against: [:first_name, :last_name],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :date_of_birth, presence: true
  # validates :gender, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :zipcode, presence: true
  # validates :job_title, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true
end
