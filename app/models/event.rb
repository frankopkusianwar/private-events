class Event < ApplicationRecord
  has_many :creates, foreign_key: 'event_id'
  has_many :creators, through: :creates, source: :user
  has_many :invitations
  has_many :users_invited, through: :invitations, source: :invitee

  has_many :attendances, foreign_key: 'event_id'
  has_many :users_attendants, through: :attendances, source: :user
end
