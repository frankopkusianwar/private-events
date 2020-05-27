class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  has_many :creates, foreign_key: 'event_id'
  has_many :creators, through: :creates, source: :user
  has_many :invitations
  has_many :users_invited, through: :invitations, source: :invitee

  has_many :attendances, foreign_key: 'event_id'
  has_many :users_attendants, through: :attendances, source: :user

  has_many :sign_ups, foreign_key: 'Event_id'
  has_many :users_signed_up, through: :sign_ups, source: :User

  def past?
    today = Time.now.to_s.split(' ')[0]
    if date > today
      'Coming'
    elsif date == today
      'Today'
    else
      'Past'
    end
  end
end
